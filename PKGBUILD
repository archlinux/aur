# $Id: PKGBUILD 153377 2015-12-15 13:13:19Z mtorromeo $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Bob Fanger < bfanger(at)gmail >
# Contributor: Filip <fila pruda com>, Det < nimetonmaili(at)gmail >
# AUFS ver   : GI_Jack <iamjacksemail@hackermail.com>

pkgname=r8168-aufs
_pkgname=r8168
pkgver=8.041.00
pkgrel=1
pkgdesc="A kernel module for Realtek 8168 network cards(aufs_friendly kernel)"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'linux-aufs_friendly')
makedepends=('linux-aufs_friendly-headers')
install=$_pkgname.install
source=(https://github.com/mtorromeo/r8168/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('d56f60e4157ccbf8f8717270b1acb391b0a959d9a96c2f0b4a91c683aa8b83a5')

build() {
	_kernver=$(pacman -Q linux-aufs_friendly | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-aufs_friendly/version)

	cd "$_pkgname-$pkgver"

	# avoid using the Makefile directly -- it doesn't understand
	# any kernel but the current.
	make -C /usr/lib/modules/$KERNEL_VERSION/build \
			SUBDIRS="$srcdir/$_pkgname-$pkgver/src" \
			EXTRA_CFLAGS="-DCONFIG_R8168_NAPI -DCONFIG_R8168_VLAN" \
			modules
}

package() {
	_kernver=$(pacman -Q linux-aufs_friendly | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	depends=("linux-aufs_friendly>=$_kernver" "linux-aufs_friendly<${_kernver/.*}.$(expr ${_kernver/*.} + 1)")
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-aufs_friendly/version)
	msg "Kernel = $KERNEL_VERSION"

	cd "$_pkgname-$pkgver"
	install -Dm644 src/$_pkgname.ko "$pkgdir/usr/lib/modules/extramodules-$_kernver-aufs_friendly/$_pkgname.ko"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +

	sed -i "s|extramodules-.*-aufs_friendly|extramodules-$_kernver-aufs_friendly|" "$startdir/$_pkgname.install"
}
