nam = libinput-gestures
src = PKGBUILD
inf = .SRCINFO

all: $(inf) sum check

$(inf): $(src)
	mksrcinfo

check: $(src)
	namcap $^

sum: $(src)
	updpkgsums

clean:
	rm -rf $(inf) $(nam)-* *.tar.xz *.tar.gz pkg/ src/

# vim: se ts=4:
