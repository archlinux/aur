# License: GPL
# RTL2832U Driver

dvb-usb-rtl2832u-objs := demod_rtl2832.o demod_rtl2836.o demod_rtl2840.o \
	dtmb_demod_base.o dtmb_nim_base.o dvbt_demod_base.o dvbt_nim_base.o foundation.o \
	math_mpi.o nim_rtl2832_e4000.o nim_rtl2832_fc0012.o nim_rtl2832_fc0013.o \
	nim_rtl2832_fc2580.o nim_rtl2832_max3543.o nim_rtl2832_mt2063.o nim_rtl2832_mt2266.o \
	nim_rtl2832_mxl5007t.o nim_rtl2832_r820t.o nim_rtl2832_tda18272.o nim_rtl2832_tua9001.o \
	nim_rtl2836_fc2580.o nim_rtl2836_mxl5007t.o nim_rtl2840_max3543.o nim_rtl2840_mt2063.o \
	qam_demod_base.o qam_nim_base.o rtl2832u_audio.o rtl2832u.o rtl2832u_fe.o rtl2832u_io.o \
	tuner_e4000.o tuner_fc0012.o tuner_fc0013.o tuner_fc2580.o tuner_max3543.o tuner_mt2063.o \
	tuner_mt2266.o tuner_mxl5007t.o tuner_r820t.o tuner_tda18272.o tuner_tua9001.o

obj-m += dvb-usb-rtl2832u.o

## EXTRA_CFLAGS for linux < 3.7
EXTRA_CFLAGS += -I$(KBUILD_SRC)/drivers/media/dvb/dvb-usb/ \
		-I$(KBUILD_SRC)/drivers/media/dvb/dvb-core/ \
		-I$(KBUILD_SRC)/drivers/media/dvb/frontends/ \
		-I$(KBUILD_SRC)/drivers/media/common/tuners/
## EXTRA_CFLAGS for linux >= 3.7
EXTRA_CFLAGS += -I$(KBUILD_SRC)/drivers/media/usb/dvb-usb/ \
		-I$(KBUILD_SRC)/drivers/media/dvb-core/ \
		-I$(KBUILD_SRC)/drivers/media/dvb-frontends/ \
		-I$(KBUILD_SRC)/drivers/media/tuners/

KDIR = /usr/lib/modules/$(KVER)/build

default:
	make -C $(KDIR) SUBDIRS=$(PWD) modules
