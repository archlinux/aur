UNREALROOTPATH = /tmp/makepkg/unreal-engine/src/UnrealEngine

BUILD = bash "$(UNREALROOTPATH)/Engine/Build/BatchFiles/Linux/Build.sh"

UnrealVersionSelector-Linux-Shipping:
	 $(BUILD) UnrealVersionSelector Linux Shipping  $(ARGS)
