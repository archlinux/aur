# Maintainer: Cyano Hao <c@cyano.cn>

pkgname=qemu-guest-kernel
pkgdesc="Linux kernels for QEMU/KVM guests (direct kernel boot)"
url="https://github.com/guest-kernel/qemu"

_srcmajor=5
_srcminor=10
_srcpatch=25
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
            '5a3cb361a621aa753790faee038732fffaa0406a5771f545df68a5afa2164a36'
            '61d2de3e8fbbf97ecbefedcfb53a2913ee94135276d2741adc105d57a56fdbee'
            'ef2e2b6103e6ba557106b465a9597b83e5f25ecca99cae442800a5b64e0b85e0')

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
