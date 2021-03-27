# Maintainer: Cyano Hao <c@cyano.cn>

pkgname=qemu-guest-kernel
pkgdesc="Linux kernels for QEMU/KVM guests (direct kernel boot)"
url="https://github.com/guest-kernel/qemu"

_srcmajor=5
_srcminor=10
_srcpatch=26
_srcbase=$_srcmajor.$_srcminor
_srcname=linux-$_srcbase

pkgver=$_srcbase.$_srcpatch
pkgrel=1
arch=(any)
license=(GPL2)
makedepends=(
	bc kmod libelf pahole cpio perl tar xz
	clang lld llvm
)
options=('!strip')
install=archpkg.install

source=(
	"https://cdn.kernel.org/pub/linux/kernel/v$_srcmajor.x/linux-$_srcbase".tar.{xz,sign}
	"https://cdn.kernel.org/pub/linux/kernel/v$_srcmajor.x/patch-$pkgver".xz
	config.{i686,x86_64}
)
validpgpkeys=(
	"ABAF11C65A2970B130ABE3C479BE3E4300411886"  # Linus Torvalds
	"647F28654894E3BD457199BE38DBBDC86092693E"  # Greg Kroah-Hartman
)
sha256sums=('dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43'
            'SKIP'
            '5bbc24f360f6b02597769a73ba89cfd085cdff2118aa76a0a33f021e1febdea4'
            '0736bfbb441dcaee2eabf664f4be292f53e4c245ef842a39501c38d4839f987b'
            '71fbfc0bb6a436d511682b87912daf6ffdeb6fbf28cb3f67f10a7bc2c7c0833b')

prepare() {
	cd $srcdir/$_srcname
	patch -Np1 -i $srcdir/patch-$pkgver
}

export KBUILD_BUILD_HOST=guest-kernel
export KBUILD_BUILD_USER=qemu

# since we are building for “any” architecture, treat all targets as cross build
export LLVM=1

_build() {
	cd $srcdir/$_srcname
	make mrproper

	export CROSS_COMPILE=$_carch-linux-gnu-

	cp $srcdir/config.$_carch .config
	make olddefconfig
	make bzImage

	cp $(make -s image_name) $srcdir/vmlinuz.$_carch
	# copy updated configuration back to $srcdir
	# the dest is a symlink, remove the symlink first not to overwrite the original file
	cp --remove-destination .config $srcdir/config.$_carch
}

build() {
	ARCH=x86 _carch=i686 _build
	ARCH=x86 _carch=x86_64 _build
}

package() {
	cd $srcdir/
	local target=$pkgdir/usr/share/qemu/kernel
	install -Dm644 -t $target/ $srcdir/vmlinuz.{i686,x86_64}
}
