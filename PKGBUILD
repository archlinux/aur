# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>

_target=xtensa-esp32-elf
pkgname=$_target-gcc-bootstrap
pkgver=12.2.0
_islver=0.25
_overlay_commit=a5ab689
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler bootstrap package for xtensa esp32 (bare-metal) target'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils zlib libmpc)
makedepends=(gmp mpfr)
provides=($_target-gcc)
conflicts=($_target-gcc)
options=(!emptydirs !strip)
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig}
        https://libisl.sourceforge.io/isl-$_islver.tar.bz2
        xtensa-overlays-$_overlay_commit.tar.gz::https://codeload.github.com/espressif/xtensa-overlays/tar.gz/$_overlay_commit)
sha256sums=('e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff'
            'SKIP'
            '4305c54d4eebc4bf3ce365af85f04984ef5aa97a52e01128445e26da5b1f467a'
            '0087aac5e7015d43ff904ef984278df1f99c6757709088c52632b27dc482268f')
validpgpkeys=(33C235A34C46AA3FFB293709A328C3A2C3C45C06  # Jakub Jelinek <jakub@redhat.com>
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
              13975A70E63C361C73AE69EF6EEB81F8981C74C7) # Richard Guenther <richard.guenther@gmail.com>

_basedir=gcc-$pkgver

prepare() {
	cd $_basedir

	# link isl for in-tree builds
	ln -sf ../isl-$_islver isl

	echo $pkgver > gcc/BASE-VER

	# hack! - some configure tests for header files using "$CPP $CPPFLAGS"
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
	cp -r ../xtensa-overlays-$_overlay_commit/xtensa_esp32/gcc/* .

	mkdir "$srcdir"/build-gcc
}

build() {
	cd "$srcdir"/build-gcc
	export CFLAGS="${CFLAGS/-Werror=format-security/}"
	export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"
	export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections -fno-exceptions -mlongcalls'
	export CXXFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections -fno-exceptions -mlongcalls'

	# espressif's crosstool-ng:
	# 	CC_FOR_BUILD='x86_64-build_pc-linux-gnu-gcc'
	# 	CFLAGS='-O2 -g -I./.build/xtensa-esp32-elf/buildtools/include  '
	# 	CFLAGS_FOR_BUILD='-O2 -g -I./.build/xtensa-esp32-elf/buildtools/include  '
	# 	CXXFLAGS='-O2 -g -I./.build/xtensa-esp32-elf/buildtools/include  '
	# 	CXXFLAGS_FOR_BUILD='-O2 -g -I./.build/xtensa-esp32-elf/buildtools/include  '
	# 	LDFLAGS='-L./.build/xtensa-esp32-elf/buildtools/lib   -lstdc++ -lm'
	# 	CFLAGS_FOR_TARGET=' -mlongcalls'
	# 	CXXFLAGS_FOR_TARGET=' -mlongcalls'
	# 	LDFLAGS_FOR_TARGET='  -static'
	# 	'/usr/bin/bash'
	# 	'./.build/xtensa-esp32-elf/src/gcc/configure'
	# 		'--build=x86_64-build_pc-linux-gnu'
	# 		'--host=x86_64-build_pc-linux-gnu'
	# 		'--target=xtensa-esp32-elf'
	# 		'--prefix=./.build/xtensa-esp32-elf/buildtools'
	# 		'--with-local-prefix=./builds/xtensa-esp32-elf/xtensa-esp32-elf'
	# 		'--without-headers'
	# 		'--with-newlib'
	# 		'--enable-threads=no'
	# 		'--disable-shared'
	# 		'--with-pkgversion=crosstool-NG esp-2020r3-5-gc65c037'
	# 		'--disable-__cxa_atexit'
	# 		'--disable-libgomp'
	# 		'--disable-libmudflap'
	# 		'--disable-libmpx'
	# 		'--disable-libssp'
	# 		'--disable-libquadmath'
	# 		'--disable-libquadmath-support'
	# 		'--with-gmp=./.build/xtensa-esp32-elf/buildtools'
	# 		'--with-mpfr=./.build/xtensa-esp32-elf/buildtools'
	# 		'--with-mpc=./.build/xtensa-esp32-elf/buildtools'
	# 		'--with-isl=./.build/xtensa-esp32-elf/buildtools'
	# 		'--enable-lto'
	# 		'--enable-target-optspace'
	# 		'--without-long-double-128'
	# 		'--disable-nls'
	# 		'--enable-multiarch'
	# 		'--enable-languages=c'
	# 		'--enable-threads=posix'

	"$srcdir"/$_basedir/configure \
		--libexecdir=/usr/lib \
		--prefix=/usr \
		--target=$_target \
		--with-gmp \
		--with-gnu-as \
		--with-gnu-ld \
		--with-host-libstdcxx='-static-libgcc -Wl,-Bstatic,-lstdc++,-Bdynamic -lm' \
		--with-isl \
		--with-libelf \
		--with-mpc \
		--with-mpfr \
		--with-native-system-header-dir=/include \
		--with-newlib \
		--with-python-dir=share/gcc-$_target \
		--with-sysroot=/usr/$_target \
		--with-system-zlib \
		--without-headers \
		--without-libffi \
		--disable-__cxa_atexit \
		--disable-decimal-float \
		--disable-libgomp \
		--disable-libmpx \
		--disable-libmudflap \
		--disable-libquadmath \
		--disable-libquadmath-support \
		--disable-libssp \
		--disable-libstdcxx-pch \
		--disable-libstdcxx-verbose \
		--disable-nls \
		--disable-shared \
		--disable-threads \
		--disable-tls \
		--enable-gnu-indirect-function \
		--enable-languages=c \
		--enable-lto \
		--enable-target-optspace
	make INHIBIT_LIBC_CFLAGS='-DUSE_TM_CLONE_REGISTRY=0'
}

package() {
	cd "$srcdir"/build-gcc
	make DESTDIR="$pkgdir" install -j1

	# strip host binaries
	find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/$pkgver -type f -and \( -executable \) -exec strip '{}' \;

	# Remove files that conflict with host gcc package
	rm -r "$pkgdir"/usr/share/man/man7
	rm -r "$pkgdir"/usr/share/info
	rm "$pkgdir"/usr/lib/libcc1.*
}

# vim: ts=2 sw=0 noet
