
BUILD = bash "Engine/Build/BatchFiles/Linux/Build.sh"

UnrealVersionSelector-Linux-Shipping:
	 $(BUILD) UnrealVersionSelector Linux Shipping  $(ARGS)
