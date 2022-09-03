# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>

_target=xtensa-esp32-elf
_upstream_ver=esp-2022r1
_upstream_name=newlib-esp32
pkgname=$_target-newlib
pkgver=4.1.0.${_upstream_ver#esp-}
pkgrel=1
pkgdesc='A C standard library implementation intended for use on embedded systems (xtensa esp32 bare metal)'
arch=(x86_64)
url='https://github.com/espressif/newlib-esp32'
license=(GPL)
makedepends=($_target-gcc)
options=(!emptydirs !strip)
source=("$_upstream_name-$_upstream_ver.tar.gz::https://codeload.github.com/espressif/$_upstream_name/tar.gz/$_upstream_ver")
sha256sums=('da09053863149b8fef727add21b39c11fba94b40687936677c1f58e5f9d524c4')

build() {
	rm -rf build-{newlib,nano}
	mkdir build-{newlib,nano}

	# espressif's crosstool-ng:
	# 	CC_FOR_BUILD='x86_64-build_pc-linux-gnu-gcc'
	# 	CFLAGS_FOR_TARGET='  -mlongcalls '
	# 	AR_FOR_TARGET='./.build/xtensa-esp32-elf/buildtools/bin/xtensa-esp32-elf-gcc-ar'
	# 	RANLIB_FOR_TARGET='./.build/xtensa-esp32-elf/buildtools/bin/xtensa-esp32-elf-gcc-ranlib'
	# 	'/usr/bin/bash'
	# 	'./.build/xtensa-esp32-elf/src/newlib/configure'
	# 		'--host=x86_64-build_pc-linux-gnu'
	# 		'--target=xtensa-esp32-elf'
	# 		'--prefix=./builds/xtensa-esp32-elf'
	# 		'--enable-newlib-io-float'
	# 		'--disable-newlib-io-long-double'
	# 		'--disable-newlib-supplied-syscalls'
	# 		'--enable-newlib-io-pos-args'
	# 		'--enable-newlib-io-c99-formats'
	# 		'--enable-newlib-io-long-long'
	# 		'--disable-newlib-register-fini'
	# 		'--disable-newlib-nano-malloc'
	# 		'--disable-newlib-nano-formatted-io'
	# 		'--enable-newlib-atexit-dynamic-alloc'
	# 		'--disable-newlib-global-atexit'
	# 		'--disable-lite-exit'
	# 		'--enable-newlib-reent-small'
	# 		'--enable-newlib-multithread'
	# 		'--enable-newlib-wide-orient'
	# 		'--enable-newlib-unbuf-stream-opt'
	# 		'--enable-target-optspace'
	# 		'--enable-newlib-long-time_t'
	# 		'--enable-newlib-nano-malloc'

	export CFLAGS_FOR_TARGET='-g -O2 -ffunction-sections -fdata-sections -mlongcalls'
	cd "$srcdir"/build-newlib
	../$_upstream_name-$_upstream_ver/configure \
		--target=$_target \
		--prefix=/usr \
		--enable-newlib-io-float \
		--disable-newlib-io-long-double \
		--disable-newlib-supplied-syscalls \
		--enable-newlib-io-pos-args \
		--enable-newlib-io-c99-formats \
		--enable-newlib-io-long-long \
		--disable-newlib-register-fini \
		--disable-newlib-nano-malloc \
		--disable-newlib-nano-formatted-io \
		--enable-newlib-atexit-dynamic-alloc \
		--disable-newlib-global-atexit \
		--disable-lite-exit \
		--enable-newlib-reent-small \
		--enable-newlib-multithread \
		--enable-newlib-wide-orient \
		--enable-newlib-unbuf-stream-opt \
		--enable-target-optspace \
		--enable-newlib-long-time_t \
		--enable-newlib-nano-malloc
	make

	# espressif's crosstool-ng:
	# 	CC_FOR_BUILD='x86_64-build_pc-linux-gnu-gcc'
	# 	CFLAGS_FOR_TARGET='  -mlongcalls '
	# 	AR_FOR_TARGET='./.build/xtensa-esp32-elf/buildtools/bin/xtensa-esp32-elf-gcc-ar'
	# 	RANLIB_FOR_TARGET='./.build/xtensa-esp32-elf/buildtools/bin/xtensa-esp32-elf-gcc-ranlib'
	# 	'/usr/bin/bash'
	# 	'./.build/xtensa-esp32-elf/src/newlib/configure'
	# 		'--host=x86_64-build_pc-linux-gnu'
	# 		'--target=xtensa-esp32-elf'
	# 		'--prefix=./builds/xtensa-esp32-elf'
	# 		'--with-newlib'
	# 		'--enable-multilib'
	# 		'--disable-newlib-io-c99-formats'
	# 		'--disable-newlib-supplied-syscalls'
	# 		'--enable-newlib-nano-formatted-io'
	# 		'--enable-newlib-reent-small'
	# 		'--enable-target-optspace'
	# 		'--enable-newlib-long-time_t'
	# 		'--enable-newlib-nano-malloc'

	export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections -mlongcalls'
	cd "$srcdir"/build-nano
	../$_upstream_name-$_upstream_ver/configure \
		--target=$_target \
		--prefix=/usr \
		--with-newlib \
		--enable-multilib \
		--disable-newlib-io-c99-formats \
		--disable-newlib-supplied-syscalls \
		--enable-newlib-nano-formatted-io \
		--enable-newlib-reent-small \
		--enable-target-optspace \
		--enable-newlib-long-time_t \
		--enable-newlib-nano-malloc
	make
}

package() {
	cd "$srcdir"/build-nano
	make DESTDIR="$pkgdir" install -j1
	find "$pkgdir" -regex ".*/lib\(c\|g\|rdimon\)\.a" -exec rename .a _nano.a '{}' \;
	install -d "$pkgdir"/usr/$_target/include/newlib-nano
	install -m644 -t "$pkgdir"/usr/$_target/include/newlib-nano "$pkgdir"/usr/$_target/include/newlib.h

	cd "$srcdir"/build-newlib
	make DESTDIR="$pkgdir" install -j1

	find "$pkgdir"/usr/$_target/lib \( -name "*.a" -or -name "*.o" \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

	install -d "$pkgdir"/usr/share/licenses/$pkgname/
	install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/$_upstream_name-$_upstream_ver/COPYING*
}

