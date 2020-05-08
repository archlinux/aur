# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>

_target=xtensa-esp32-elf
pkgname=$_target-gcc
pkgver=10.1.0
_islver=0.22
_overlay_commit=fe9a594
pkgrel=2
#_snapshot=8-20180427
pkgdesc='The GNU Compiler Collection - cross compiler for xtensa esp32 (bare-metal) target'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils zlib libmpc)
makedepends=(gmp mpfr $_target-newlib)
optdepends=("$_target-newlib: Standard C library optimized for embedded systems")
options=(!emptydirs !strip)
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig}
        #ftp://gcc.gnu.org/pub/gcc/snapshots/$_snapshot/gcc-$_snapshot.tar.xz
        http://isl.gforge.inria.fr/isl-$_islver.tar.bz2
        xtensa-overlays-$_overlay_commit.tar.gz::https://codeload.github.com/espressif/xtensa-overlays/tar.gz/$_overlay_commit)
sha256sums=('b6898a23844b656f1b68691c5c012036c2e694ac4b53a8918d4712ad876e7ea2'
            'SKIP'
            'b21d354acd613a91cb88328753ec3aaeb174d6af042d89c5fcf3bbcced370751'
            '025a16d88ae7b17c013ed23beb02b8545b44673d2b8ecca748e63a79d5c1070d')
validpgpkeys=(33C235A34C46AA3FFB293709A328C3A2C3C45C06) # Jakub Jelinek <jakub@redhat.com>

if [ -n "$_snapshot" ]; then
	_basedir=gcc-$_snapshot
else
	_basedir=gcc-$pkgver
fi

prepare() {
	cd $_basedir

	# link isl for in-tree builds
	ln -s ../isl-$_islver isl

	echo $pkgver > gcc/BASE-VER

	# hack! - some configure tests for header files using "$CPP $CPPFLAGS"
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
	cp -r ../xtensa-overlays-$_overlay_commit/xtensa_esp32/gcc/* .

	mkdir "$srcdir"/build-{gcc,gcc-nano}
}

_build_gcc() {
	"$srcdir"/$_basedir/configure \
		--target=$_target \
		--prefix=/usr \
		--with-sysroot=/usr/$_target \
		--with-native-system-header-dir=/include \
		--libexecdir=/usr/lib \
		--enable-languages=c,c++ \
		--enable-plugins \
		--disable-decimal-float \
		--disable-libffi \
		--disable-libgomp \
		--disable-libmudflap \
		--disable-libquadmath \
		--disable-libssp \
		--disable-libstdcxx-pch \
		--disable-nls \
		--disable-shared \
		--disable-threads \
		--disable-tls \
		--with-gnu-as \
		--with-gnu-ld \
		--with-system-zlib \
		--with-newlib \
		--with-headers=/usr/$_target/include \
		--with-python-dir=share/gcc-$_target \
		--with-gmp \
		--with-mpfr \
		--with-mpc \
		--with-isl \
		--with-libelf \
		--enable-gnu-indirect-function \
		--with-host-libstdcxx='-static-libgcc -Wl,-Bstatic,-lstdc++,-Bdynamic -lm' \
		--with-pkgversion='Arch Repository' \
		--with-bugurl='https://bugs.archlinux.org/' \
		--with-multilib-list=rmprofile

	make INHIBIT_LIBC_CFLAGS='-DUSE_TM_CLONE_REGISTRY=0'
}

build() {
	cd "$srcdir"/build-gcc
	export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'
	export CXXFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'
	_build_gcc

	# Build libstdc++ without exceptions support (the 'nano' variant)
	cd "$srcdir"/build-gcc-nano
	export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections -fno-exceptions'
	export CXXFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections -fno-exceptions'  
	_build_gcc
}

package() {
	cd "$srcdir"/build-gcc
	make DESTDIR="$pkgdir" install -j1

	cd "$srcdir"/build-gcc-nano
	make DESTDIR="$pkgdir.nano" install -j1
	# we need only libstdc nano files
	multilibs=( $("$pkgdir"/usr/bin/$_target-gcc -print-multi-lib 2>/dev/null) )
	for multilib in "${multilibs[@]}"; do
		dir="${multilib%%;*}"
		from_dir="$pkgdir".nano/usr/$_target/lib/"$dir"
		to_dir="$pkgdir"/usr/$_target/lib/"$dir"
		cp -f "$from_dir"/libstdc++.a "$to_dir"/libstdc++_nano.a
		cp -f "$from_dir"/libsupc++.a "$to_dir"/libsupc++_nano.a
	done

	# strip target binaries
	find "$pkgdir"/usr/lib/gcc/$_target/$pkgver "$pkgdir"/usr/$_target/lib -type f -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

	# strip host binaries
	find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/$pkgver -type f -and \( -executable \) -exec strip '{}' \;

	# Remove files that conflict with host gcc package
	rm -r "$pkgdir"/usr/share/man/man7
	rm -r "$pkgdir"/usr/share/info
	rm "$pkgdir"/usr/lib/libcc1.*
}

# vim: ts=2 sw=0 noet
