# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>
# Contributor: janezz55

pkgname=dosbox-gcc
pkgver=9.1.0
_target="i586-pc-msdosdjgpp"
_islver=0.18
_djver=2.05
_pthver=3.14
_zlver=1.2.11
_wattver="2.2-dev.10"
pkgrel=2
pkgdesc="djgpp cross-compiler for the dosbox environment"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('djgpp')
depends=('zlib' 'libmpc' 'dosbox-binutils')
makedepends=('unzip')
optdepends=('dosbox-djcrx: headers and utilities')
options=('!strip' 'staticlibs' '!emptydirs')
source=("https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-$pkgver.tar.xz"
        "ftp://www.delorie.com/pub/djgpp/current/v2/djcrx${_djver//./}.zip"
        "http://isl.gforge.inria.fr/isl-${_islver}.tar.xz"
        "https://zlib.net/zlib-${_zlver}.tar.gz"
        "http://www.watt-32.net/watt32s-${_wattver}.zip"
        "mkmake.bash"
        "watt32.pc"
	"gcc-djgpp.diff"
        "lto.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c03dbd61274e1ce14f84366abf348d75779bbd6e0bc32b9f4fd74f1ce54a5ef0')
noextract=("djcrx${_djver//./}.zip"
           "watt32s-${_wattver}.zip")

prepare() {
  # extract bootstrap wattcp
  mkdir -p watt
  cd watt
  unzip -qo "../watt32s-${_wattver}.zip"

  # apply felix's patches
	sed -i -e '
		s,#include "/dev/env/DJDIR/include/\(.*\)",#include_next <\1>,
	' inc/sys/cdefs.h

 	cd src
	ln -fs chksum0.s  chksum0.S
	ln -fs cpumodel.s cpumodel.S

  mkdir -p djgpp

	# use standard zlib
	sed -i -e 's,"zlib/zlib\.h",<zlib.h>,' pcdbug.c
	sed -i -e '/define Z_PREFIX/ d' config.h

	sed -i -e '
		s,\tar,\t$(AR),
		s,\.\./util/nasm32,\t$(NASM),
		s,\.\./util/bin2c,\t$(BIN2C),
    s,-O2,-Ofast,
	' makefile.all zlib/makefile.all
  sed -i -e "
		/CFLAGS/ s,=,= -fno-strict-aliasing -fgnu89-inline -march=i586 -I${srcdir}/zlib-${_zlver},
  " makefile.all zlib/makefile.all
	bash "$srcdir/mkmake.bash" DJGPP RELEASE <makefile.all >djgpp.mak

  cd ../util
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

  # gcc hacks
  cd $srcdir/gcc-$pkgver

  # link isl for in-tree build
  ln -fs "../isl-${_islver}" isl

  # hack! - some configure tests for header files break with FORTIFY_SOURCE
  sed -i "/ac_cpp=/ s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # build the lto plugin
  patch -Np0 < ../lto.patch

  # Other DJGPP related changes
  patch -Np1 < ../gcc-djgpp.diff

  # extract bootstrap djcrx
  mkdir -p ../gcc-build-$_target/lib/gcc/$_target/$pkgver
  cd ../gcc-build-${_target}/lib/gcc/$_target/$pkgver
  unzip -qoW "$srcdir/djcrx${_djver//./}.zip" 'include/**' 'lib/*.[oa]'
  mv lib/* .
}

build() {
  OLD_PATH=$PATH

  cd gcc-build-$_target
  ../gcc-$pkgver/configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --datarootdir=/usr/$_target/share \
    --target="$_target" \
    --disable-ld \
    --disable-nls \
    --disable-libssp \
    --disable-libquadmath \
    --disable-libquadmath-support \
    --disable-libgomp \
    --disable-install-libiberty \
    --enable-decimal-float \
    --enable-gold \
    --enable-languages=c,c++ \
    --enable-shared \
    --enable-static \
    --with-system-zlib \
    --with-arch=i586 \
    --with-cpu=i586 \
    --enable-threads \
    --enable-libstdcxx-threads \
    --enable-lto \
    --enable-libstdcxx-filesystem-ts \
    --enable-libstdcxx-time \
    --disable-multilib --enable-checking=release
  make all-gcc

  export PATH=$srcdir/gcc-build-$_target/gcc:$PATH

  # build zlib
  echo ...building zlib
  cd $srcdir/zlib-${_zlver}
  CC=$srcdir/gcc-build-$_target/gcc/xgcc \
  CHOST=${_target} \
  CFLAGS="-march=i586 -Ofast -DHAVE_VSNPRINTF -I$srcdir/gcc-build-${_target}/lib/gcc/$_target/$pkgver/include -pipe" \
  ../zlib-${_zlver}/configure --const --prefix=/usr/$_target --static
  sed -i 's/-DNO_STRERROR -DNO_vsnprintf//' Makefile
  make libz.a

  # build wattcp
  echo ...building wattcp
  cd $srcdir/watt/util
	$srcdir/gcc-build-$_target/gcc/xgcc -P -E errnos0.c \
		-include $srcdir/gcc-build-${_target}/lib/gcc/$_target/$pkgver/include/errno.h \
		-include $srcdir/gcc-build-${_target}/lib/gcc/$_target/$pkgver/include/sys/version.h \
		| sed -e '/^extern/ d' > errnos0.i

	# TCC would also do
  export PATH=$OLD_PATH
	gcc errnos1.c -o errnos1
	./errnos1 -e > "../inc/sys/djgpp.err"
	./errnos1 -s > "../src/djgpp/syserr.c"
  export PATH=$srcdir/gcc-build-$_target/gcc:$PATH

  cd $srcdir/watt/src
	make -f djgpp.mak \
		CC=$srcdir/gcc-build-$_target/gcc/xgcc -I$srcdir/gcc-build-${_target}/lib/gcc/$_target/$pkgver/include \
		AS=$_target-as \
		AR=$_target-ar \
		NASM=/usr/bin/nasm \
		BIN2C='hexdump -ve "1/1 \"0x%02X\,\" \"\n\""' \
		DJDIR=/usr/$_target ZLIB_OBJS=

  # start building gcc again, with pthreads
  echo ...back to building gcc
  export PATH=$OLD_PATH

  cd $srcdir/gcc-build-$_target
  make all
}

package_dosbox-gcc() {
  echo ...installing
  make -C gcc-build-$_target DESTDIR="$pkgdir/" install
  make -C zlib-${_zlver} DESTDIR="$pkgdir/" install

  # strip manually, djgpp libs spew errors otherwise
  strip -s "$pkgdir"/usr/bin/$_target-*
  strip -s "$pkgdir"/usr/lib/gcc/$_target/$pkgver/{cc1*,collect2,lto*}

  # for compatibility
  ln -sf $_target-gcc "$pkgdir"/usr/bin/$_target-cc

  # remove unnecessary files
  rm -rf "$pkgdir"/usr/$_target/share/{man,info,locale}
  rm -rf "$pkgdir"/usr/share/{man,info,locale}
  rm -rf "$pkgdir"/usr/lib/gcc/$_target/$pkgver/include-fixed
  rm -f "$pkgdir"/usr/lib/libcc1.*

  # install wattcp
	cd "$srcdir/watt/inc"

	install -dm0755 "$pkgdir/usr/$_target/include/watt32"
	install -m0644 *.h "$pkgdir/usr/$_target/include/watt32"
	for _d in netinet6 protocol netinet net rpc rpcsvc sys arpa; do
		install -dm0755 "$pkgdir/usr/$_target/include/watt32/$_d"
		install -m0644 "$_d"/*.h "$pkgdir/usr/$_target/include/watt32/$_d"
	done
	install -dm0755 "$pkgdir/usr/$_target/include/sys"
	install -m0644 sys/djgpp.err "$pkgdir/usr/$_target/include/sys/djgpp.err"

	cd "$srcdir/watt/lib"
	install -Dm0644 libwatt.a "$pkgdir/usr/$_target/lib/libwatt.a"
	install -Dm0644 $srcdir/watt32.pc "$pkgdir/usr/$_target/lib/pkgconfig/watt32.pc"
}
