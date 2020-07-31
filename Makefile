filter_dkimsign_obj += filter-dkimsign/main.o
libopensmtpd_obj += libopensmtpd/iobuf.o
libopensmtpd_obj += libopensmtpd/ioev.o
libopensmtpd_obj += libopensmtpd/opensmtpd.o
openbsd_compat_obj += libopensmtpd/openbsd-compat/recallocarray.o
openbsd_compat_obj += libopensmtpd/openbsd-compat/strlcat.o
openbsd_compat_obj += libopensmtpd/openbsd-compat/strlcpy.o
openbsd_compat_obj += libopensmtpd/openbsd-compat/strtonum.o

libraries += -lssl -lcrypto -levent

CPPFLAGS += -Ilibopensmtpd
CPPFLAGS += -Ilibopensmtpd/openbsd-compat

CPPFLAGS += -D_DEFAULT_SOURCE
CPPFLAGS += -DNEED_OPENBSD_COMPAT=1
CPPFLAGS += -DNEED_RECALLOCARRAY=1
CPPFLAGS += -DNEED_STRLCAT=1
CPPFLAGS += -DNEED_STRLCPY=1
CPPFLAGS += -DNEED_STRTONUM=1
CPPFLAGS += -DNO_PLEDGE=1

.PHONY: clean

filter-dkimsign/filter-dkimsign: $(filter_dkimsign_obj) $(libopensmtpd_obj) $(openbsd_compat_obj)
	$(CC) $(CFLAGS) $(LDFLAGS) -o "$@" $^ $(libraries)

clean:
	rm -rf filter-dkimsign/filter-dkimsign $(filter_dkimsign_obj) $(libopensmtpd_obj) $(openbsd_compat_obj)
