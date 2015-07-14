SRCS = cpdup.c fsmid.c hclink.c hcproto.c misc.c
OBJS = $(SRCS:%.c=%.o)
DEPS = $(SRCS:%.c=%.d)

CPPFLAGS += -D_GNU_SOURCE -D__USE_FILE_OFFSET64 -MD -MP \
	    -D"__printflike(fmtarg, firstvararg)=__attribute__((__format__ (__printf__, fmtarg, firstvararg)))" \
	    -D"__printf0like(fmtarg, firstvararg)=__attribute__((__format__ (__printf0__, fmtarg, firstvararg)))"

ifndef NOPTHREADS
CFLAGS += -DUSE_PTHREADS=1 -pthread
endif

ifdef NOMD5
CFLAGS += -DNOMD5
else
CFLAGS += $(shell pkg-config --cflags libbsd-overlay)
LDLIBS += $(shell pkg-config --libs libbsd-overlay)
SRCS += md5.c
endif

all: cpdup

cpdup: $(OBJS)

clean:
	-rm -f $(OBJS) $(DEPS)

-include $(DEPS)
