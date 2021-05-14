# Maintainer: Cyano Hao <c@cyano.cn>

pkgname=qemu-guest-kernel
pkgdesc="Linux kernels for QEMU/KVM guests (direct kernel boot)"
url="https://github.com/guest-kernel/qemu"

_srcmajor=5
_srcminor=10
_srcpatch=37
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
	config.x86
)
validpgpkeys=(
	"ABAF11C65A2970B130ABE3C479BE3E4300411886"  # Linus Torvalds
	"647F28654894E3BD457199BE38DBBDC86092693E"  # Greg Kroah-Hartman
)
sha256sums=('dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43'
            'SKIP'
            '1e86da1a877f1dd3485c52fc97282351cc5c98ec5e66aa9c626142ada78fab38'
            '98a6c9a50221685ff9bd510c1a413caeddcbb6ecc4b2855bc82d3b5ea3979311')

prepare() {
	cd "$srcdir/$_srcname"
	patch -Np1 -i "$srcdir/patch-$pkgver"
	for _arch in x86
	do
		cp "$srcdir/config.$_arch" arch/$_arch/configs/qemu_extra.config
	done
}

export KBUILD_BUILD_HOST=guest-kernel
export KBUILD_BUILD_USER=qemu

# since we are building for “any” architecture, treat all targets as cross build
export LLVM=1

_build() {
	cd "$srcdir/$_srcname"
	make mrproper

	export CROSS_COMPILE=$_carch-linux-gnu-

	make ${_def_prefix}defconfig
	make kvm_guest.config
	make qemu_extra.config

	make
	cp $(make -s image_name) "$srcdir/vmlinuz.$_carch"
}

build() {
	ARCH="x86" _carch="i686" _def_prefix="i386_" _build
	ARCH="x86" _carch="x86_64" _def_prefix="x86_64_" _build
}

package() {
	cd "$srcdir"
	local _target="$pkgdir/usr/share/qemu/kernel"
	install -Dm644 -t "$_target" "$srcdir"/vmlinuz.{i686,x86_64}
}
