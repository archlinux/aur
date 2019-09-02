# this makefile replaces the build script included with the .tar.gz
# archive - the install script is not designed for 'packaging' use-cases

CFLAGS+= -I. -DSHARED_LIB_EXT=\".so\"
LDFLAGS+= -ldl

.PHONY: all debug release

all: debug release

debug: CFLAGS += -DBUILD_TYPE_POSTFIX=\"_d\"
debug: sac2c_d sac4c_d sac2tex_d

release: CFLAGS += -DBUILD_TYPE_POSTFIX=\"_p\"
release: sac2c_p sac4c_p sac2tex_p

sac2c_%: sac2c.c sactools.h sacdirs_%.h
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

sac4c_%: sac4c.c sactools.h sacdirs_%.h
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

sac2tex_%: sac2tex.c sactools.h sacdirs_%.h
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

sacdirs_d.h: sacdirs.h
	@sed 's/SAC2C_POSTFIX "_p"/SAC2C_POSTFIX "_d"/' $^ > $@

sacdirs_p.h: sacdirs.h
	@sed 's/SAC2C_POSTFIX "_d"/SAC2C_POSTFIX "_p"/' $^ > $@
