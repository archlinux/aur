pkgname=djgpp-watt32
pkgver=2.2.dev.rel.10
pkgrel=1
pkgdesc='A TCP/IP stack for DJGPP programs, based on the Waterloo TCP library (WATTCP)'
url='http://www.watt-32.net/'
license=(custom:freeware)
arch=(i686 x86_64)
depends=(djgpp-zlib)
makedepends=(djgpp-gcc gcc nasm bash)
source=(
	"http://www.watt-32.net/watt32s-${pkgver//.dev.rel./-dev.}.zip"
	mkmake.bash
	watt32.pc
)
sha512sums=(
	'63e57e6da2a238d5970b0cac149940126cc85c919eb33ddb0b8bae0dfafadbf70e3a93b9462d34a62c49aa77000f6cfe7a170eecb22d706b0ad40e5c6f9a0f5b'
	'3ea25f72bf6db9233da82a2939fd4dd0ff2c2706ce168733c216af61c6f49e5ec32d15ad1ca7576865a7c0711c1e2d2c0dc22d078b3fb0df663ad1cb9d8d74af'
	'0e8212676b974da25eac0afb42d044ef677ce7593c615e0a0a1875fdfdfe9a813961a6a502402eefe93e43930fbf7474525c1657e637f0ac449626606642c86c'
)
options=(!buildflags !strip)

prepare() {
	cd "$srcdir"
	sed -i -e '
		s,#include "/dev/env/DJDIR/include/\(.*\)",#include_next <\1>,
	' inc/sys/cdefs.h
	mkdir -p src/djgpp

	cd "$srcdir/src"
	ln -fs chksum0.s  chksum0.S
	ln -fs cpumodel.s cpumodel.S

	# use standard zlib
	sed -i -e 's,"zlib/zlib\.h",<zlib.h>,' pcdbug.c
	sed -i -e '/define Z_PREFIX/ d' config.h

	sed -i -e '
		s,\tar,\t$(AR),
		s,\.\./util/nasm32,\t$(NASM),
		s,\.\./util/bin2c,\t$(BIN2C),
		/CFLAGS/ s,=,= -fno-strict-aliasing -fgnu89-inline,
	' makefile.all zlib/makefile.all
	bash "$srcdir/mkmake.bash" DJGPP RELEASE <makefile.all >djgpp.mak
	# bash "$srcdir/mkmake.bash" DJGPP RELEASE <zlib/makefile.all >zlib/djgpp.mak
}

build() {
	# grotesque hacks to make this cross-compile...
	cd "$srcdir/util"
	sed -n -e '
		$ {
			i #include "errnos0.i"
			x
			w errnos0.c
			q
		};
		/_ERRNO(/ H
		/<io\.h>/ d
		/\(VendorName\|VendorVersion\|process\|prologue\|epilogue\) (void)\r$/,/^\}\r$/ ! { p; b };
		H
	' errnos.c > errnos1.c

	i686-pc-msdosdjgpp-gcc -P -E errnos0.c \
		-include /usr/i686-pc-msdosdjgpp/include/errno.h \
		-include /usr/i686-pc-msdosdjgpp/include/sys/version.h \
		| sed -e '/^extern/ d' > errnos0.i

	# TCC would also do
	gcc errnos1.c -o errnos1
	./errnos1 -e > "$srcdir/inc/sys/djgpp.err"
	./errnos1 -s > "$srcdir/src/djgpp/syserr.c"

	# a bit less grotesque hacks
	cd "$srcdir/src"

	make -f djgpp.mak \
		CC=i686-pc-msdosdjgpp-gcc \
		AS=i686-pc-msdosdjgpp-as \
		AR=i686-pc-msdosdjgpp-gcc-ar \
		NASM=/usr/bin/nasm \
		BIN2C='hexdump -ve "1/1 \"0x%02X\,\" \"\n\""' \
		DJDIR=/usr/i686-pc-msdosdjgpp ZLIB_OBJS=
}

package() {
	cd "$srcdir"
	for _f in manual.txt readme readme.too thanks changes; do
		install -Dm0644 "$_f" "$pkgdir/usr/share/doc/$pkgname/$_f"
	done

	install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
	sed -ne 'p; /situation\./ q' manual.txt > "$pkgdir/usr/share/licenses/$pkgname/license.txt"

	cd "$srcdir/inc"

	install -dm0755     "$pkgdir/usr/i686-pc-msdosdjgpp/include/watt32"
	install -Dm0644 *.h "$pkgdir/usr/i686-pc-msdosdjgpp/include/watt32"
	for _d in netinet6 protocol netinet net rpc rpcsvc sys arpa; do
		install -dm0755 "$pkgdir/usr/i686-pc-msdosdjgpp/include/watt32/$_d"
		install -Dm0644 "$_d"/*.h "$pkgdir/usr/i686-pc-msdosdjgpp/include/watt32/$_d"
	done
	install -Dm0644 sys/djgpp.err "$pkgdir/usr/i686-pc-msdosdjgpp/include/watt32/sys/djgpp.err"

	cd "$srcdir/lib"
	install -Dm0644 libwatt.a "$pkgdir/usr/i686-pc-msdosdjgpp/lib/libwatt.a"

	install -Dm0644 watt32.pc "$pkgdir/usr/i686-pc-msdosdjgpp/lib/pkgconfig/watt32.pc"
}
