# Simple config

# net/can
export CONFIG_CAN            := m
export CONFIG_CAN_RAW        := m
export CONFIG_CAN_BCM        := m
export CONFIG_CAN_GW         := m
export CONFIG_CAN_VCAN       := m

# drives/net/can
#export CONFIG_CAN_CALC_BITTIMING := y
export CONFIG_CAN_DEV            := m
export CONFIG_CAN_KVASER_USB     := m

SRC_DIRS := net/can drivers/net/can

modules: $(SRC_DIRS)

$(SRC_DIRS):
	$(MAKE) -C /lib/modules/`uname -r`/build M="$(M)/$@" subdir-ccflags-y=-DCONFIG_CAN_CALC_BITTIMING

.PHONY: $(SRC_DIRS) modules
