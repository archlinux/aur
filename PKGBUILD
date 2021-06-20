# Maintainer: Cyano Hao <c@cyano.cn>

pkgname=qemu-guest-kernel
pkgver=5.10.45
pkgrel=1
pkgdesc="Linux kernels for QEMU/KVM guests (direct kernel boot)"
url="https://github.com/guest-kernel/qemu"
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
	config.x86
)
validpgpkeys=(
	"ABAF11C65A2970B130ABE3C479BE3E4300411886"  # Linus Torvalds
	"647F28654894E3BD457199BE38DBBDC86092693E"  # Greg Kroah-Hartman
)
sha256sums=('SKIP'
            '98a6c9a50221685ff9bd510c1a413caeddcbb6ecc4b2855bc82d3b5ea3979311')

prepare() {
	cd "$srcdir/$_srcname"
	for _arch in x86
	do
		cp "$srcdir/config.$_arch" arch/$_arch/configs/qemu_extra.config
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
	make qemu_extra.config

	make
	cp $(make -s image_name) "$srcdir/vmlinuz.$_carch"
}

_native_build() {
	cd "$srcdir/$_srcname"
	make mrproper

	unset LLVM
	unset CROSS_COMPILE

	make defconfig
	make kvm_guest.config
	make qemu_extra.config

	make
	cp $(make -s image_name) "$srcdir/vmlinuz.$CARCH"
}

build() {
	ARCH="x86" _carch="i686" _def_prefix="i386_" _build

	if [[ $CARCH == "x86_64" ]]
	then
		# prefer native GNU toolchain for x32 ABI support
		_native_build
	else
		# and remove the config if not available to avoid confusion
		sed -i '/CONFIG_X86_X32/d' "$srcdir"/$_srcname/arch/x86/configs/qemu_extra.config
		ARCH="x86" _carch="x86_64" _def_prefix="x86_64_" _build
	fi
}

package() {
	cd "$srcdir"
	local _target="$pkgdir/usr/share/qemu/kernel"
	install -Dm644 -t "$_target" "$srcdir"/vmlinuz.{i686,x86_64}
}
