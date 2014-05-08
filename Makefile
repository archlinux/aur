#
# Makefile
# Adrian Perez, 2014-05-08 17:42
#

LDFLAGS = $(EXTRA_LDFLAGS) -ldl -lpthread
CFLAGS = $(EXTRA_CFLAGS) -fPIC

define link-shared
$(CC) -shared -o $@ $^ $(LDFLAGS)
endef

define link-bin
$(CC) -o $@ $^ $(LDFLAGS)
endef

all: sigmavpn proto_raw.o intf_udp.o intf_dummy.o intf_tuntap.o

sigmavpn: main.o modules.o types.o dep/ini.o
	$(link-bin)
proto_raw.o: proto/proto_raw.o
	$(link-shared)
intf_dummy.o: intf/intf_dummy.o
	$(link-shared)
intf_tuntap.o: intf/intf_tuntap.o
	$(link-shared)
intf_udp.o: intf/intf_udp.o
	$(link-shared)


ifeq ($(USE_SODIUM),1)
SODIUM_CFLAGS := $(shell pkg-config libsodium --cflags)
SODIUM_LIBS   := $(shell pkg-config libsodium --libs)

fake-include-dir: include
include:
	ln -sf /usr/include/sodium $@
.PHONY: fake-include-dir

all: fake-include-dir | naclkeypair proto_nacl0.o proto_nacltai.o

naclkeypair: CFLAGS += $(SODIUM_CFLAGS)
naclkeypair: LDFLAGS += $(SODIUM_LIBS)
naclkeypair: naclkeypair.o types.o
	$(link-bin)

proto_nacl0.o: CFLAGS += $(SODIUM_CFLAGS)
proto_nacl0.o: LDFLAGS += $(SODIUM_LIBS)
proto_nacl0.o: proto/proto_nacl0.o types.o
	$(link-shared)

proto_nacltai.o: CFLAGS += $(SODIUM_CFLAGS)
proto_nacltai.o: LDFLAGS += $(SODIUM_LIBS)
proto_nacltai.o: proto/proto_nacltai.o types.o
	$(link-shared)
endif

clean:
	$(RM) sigmavpn main.o modules.o types.o dep/ini.o
	$(RM) proto_raw.o proto/proto_raw.o
	$(RM) proto_nacl0.o proto/proto_nacl0.o
	$(RM) proto_nacltai.o proto/proto_nacltai.o
	$(RM) intf_udp.o intf/intf_udp.o
	$(RM) intf_dummy.o intf/intf_dummy.o
	$(RM) intf_tuntap.o intf/intf_tuntap.o

# vim:ft=make
#
