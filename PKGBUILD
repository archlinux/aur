# Maintainer: Cyano Hao <c@cyano.cn>

pkgname=qemu-guest-kernel
pkgver=5.10.53
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
            '050c5d02668544d3b07fbd65a5cddb00fe203d07a95b7f924f9de191e55e151f'
            '910b7965db9777794b923ba36c83b682593c55775a7cc0a91fe28c2b7a43ade1'
            '145a82106497e007df1b17612f2215c2ae0edd8918762a636aad48e7c83cf20f')

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

_native_build() {
	cd "$srcdir/$_srcname"
	make mrproper

	unset LLVM
	unset CROSS_COMPILE

	make defconfig
	make kvm_guest.config
	make filesystem.config
	make systemd.config
	make arch_specific.config

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
