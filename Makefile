# Simple config

# drivers/video/fbdev/sis
export CONFIG_FB_SIS         := m
export CONFIG_FB_SIS_300     := y
export CONFIG_FB_SIS_315     := y

SRC_DIRS := drivers/video/fbdev/sis

modules: $(SRC_DIRS)

$(SRC_DIRS):
	$(MAKE) -C /lib/modules/`uname -r`/build M="$(M)/$@"

.PHONY: $(SRC_DIRS) modules
