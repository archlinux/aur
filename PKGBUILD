# Maintainer: Cyano Hao <c@cyano.cn>

pkgname=qemu-guest-kernel
pkgver=5.15.53
pkgrel=1
pkgdesc="Linux kernels for QEMU/KVM guests (direct kernel boot)"
url="https://github.com/cyano-linux/qemu-guest-kernel"
arch=(any)
license=(GPL2)
makedepends=(
	bc kmod libelf pahole cpio perl tar xz
	git
	clang lld llvm
)
options=('!strip')
install=archpkg.install

_srcname=stable-linux
source=(
	$_srcname::"git+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git?signed#tag=v$pkgver"
	{filesystem,systemd}.config
	arch_x86.config
)
validpgpkeys=(
	"ABAF11C65A2970B130ABE3C479BE3E4300411886"  # Linus Torvalds
	"647F28654894E3BD457199BE38DBBDC86092693E"  # Greg Kroah-Hartman
	"E27E5D8A3403A2EF66873BBCDEA66FF797772CDC"  # Sasha Levin
	"AC2B29BD34A6AFDDB3F68F35E7BFC8EC95861109"  # Ben Hutchings
)
sha256sums=('SKIP'
            '9a917bb710be091e5b1d05185f009b6eb67b4b668389da185e56909da2b10d06'
            '0ccbd0d29149c3752303aea276eea713cd1cb0687ea0239bdbaa20732b31e868'
            '45cf6ec7c89fd3649c495cd011ebc58a58f76df08950044475cf2c96cde9aac8')

prepare() {
	cd "$srcdir/$_srcname"
	cp "$srcdir/"{filesystem,systemd}.config kernel/configs/

	for _arch in x86
	do
		cp "$srcdir/arch_$_arch.config" arch/$_arch/configs/arch_specific.config
	done
}

export KBUILD_BUILD_HOST=guest-kernel
export KBUILD_BUILD_USER=qemu

_build() {
	cd "$srcdir/$_srcname"
	make mrproper

	export LLVM=1
	export CROSS_COMPILE=$_carch-linux-gnu-

	make ${_def_prefix}defconfig
	make kvm_guest.config
	make filesystem.config
	make systemd.config
	make arch_specific.config

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
