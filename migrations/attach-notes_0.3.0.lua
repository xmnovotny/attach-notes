
-- Update helper metatables
local function refreshHelpers(obj)
	if type(obj) == "table" and not obj.__self then 
		for key,val in pairs(obj) do
			refreshHelpers(val)
		end

		if rawget(obj, "__on") ~= nil then
			rawset(obj, "__mt", "helpers")
		end
	end
end

refreshHelpers(global)



-- Update metatables
rawset(global.notes, "__mt", "entityAsIndex")


log("Attach notes: Global metatables have been updated")


