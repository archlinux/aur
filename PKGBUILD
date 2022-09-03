# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>

_target=xtensa-esp32-elf
pkgname=$_target-binutils
pkgver=2.39
_overlay_commit=a5ab689
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the xtensa esp32 (bare-metal) target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(libelf)
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2{,.sig}
        xtensa-overlays-$_overlay_commit.tar.gz::https://codeload.github.com/espressif/xtensa-overlays/tar.gz/$_overlay_commit)
sha256sums=('da24a84fef220102dd24042df06fdea851c2614a5377f86effa28f33b7b16148'
            'SKIP'
            '0087aac5e7015d43ff904ef984278df1f99c6757709088c52632b27dc482268f')
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93'  # Tristan Gingold <gingold@adacore.com>
              '3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
	cd binutils-$pkgver
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
	cp -r ../xtensa-overlays-$_overlay_commit/xtensa_esp32/binutils/* .
}

build() {
	cd binutils-$pkgver

	# espressif's crosstool-ng:
	# 	CC_FOR_BUILD='x86_64-build_pc-linux-gnu-gcc'
	# 	CFLAGS_FOR_BUILD='-O2 -g -I./.build/xtensa-esp32-elf/buildtools/include  '
	# 	CXXFLAGS_FOR_BUILD='-O2 -g -I./.build/xtensa-esp32-elf/buildtools/include  '
	# 	LDFLAGS_FOR_BUILD='-L./.build/xtensa-esp32-elf/buildtools/lib  '
	# 	CFLAGS='-O2 -g -pipe -I./.build/xtensa-esp32-elf/buildtools/include  '
	# 	CXXFLAGS='-O2 -g -pipe -I./.build/xtensa-esp32-elf/buildtools/include  '
	# 	LDFLAGS='-L./.build/xtensa-esp32-elf/buildtools/lib  '
	# 	'/usr/bin/bash'
	# 	'./.build/xtensa-esp32-elf/src/binutils/configure'
	# 		'--build=x86_64-build_pc-linux-gnu'
	# 		'--host=x86_64-build_pc-linux-gnu'
	# 		'--target=xtensa-esp32-elf'
	# 		'--prefix=./builds/xtensa-esp32-elf'
	# 		'--disable-werror'
	# 		'--enable-ld=yes'
	# 		'--enable-gold=no'
	# 		'--with-pkgversion=crosstool-NG esp-2020r3-5-gc65c037'
	# 		'--enable-multilib'
	# 		'--disable-sim'
	# 		'--disable-gdb'
	# 		'--disable-nls'
	# 		'--with-sysroot=./builds/xtensa-esp32-elf/xtensa-esp32-elf'

	./configure \
		--target=$_target \
		--with-sysroot=/usr/$_target \
		--prefix=/usr \
		--enable-multilib \
		--enable-interwork \
		--with-gnu-as \
		--with-gnu-ld \
		--disable-nls \
		--enable-ld=yes \
		--enable-gold \
		--enable-plugins \
		--enable-deterministic-archives \
		--disable-sim \
		--disable-gdb \
		--disable-nls
	make
}

check() {
	cd binutils-$pkgver
	
	# unset LDFLAGS as testsuite makes assumptions about which ones are active
	# do not abort on errors - manually check log files
	make LDFLAGS="" -k check || true
}

package() {
	cd binutils-$pkgver

	make DESTDIR="$pkgdir" install

	# Remove info documents that conflict with host version
	rm -r "$pkgdir"/usr/share/info "$pkgdir"/usr/share/man "$pkgdir"/usr/lib/bfd-plugins
}

# vim: ts=2 sw=0 noet
