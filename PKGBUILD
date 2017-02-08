# $Id: PKGBUILD 209200 2017-01-27 07:00:17Z tpowa $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Bob Fanger < bfanger(at)gmail >
# Contributor: Filip <fila pruda com>, Det < nimetonmaili(at)gmail >

_pkgname=r8168
pkgname=r8168-aufs
pkgver=8.043.02
pkgrel=4
pkgdesc="A kernel module for Realtek 8168 network cards(AUFS Friendly Kernel)"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'linux-aufs_friendly')
makedepends=('linux-aufs_friendly-headers')
install=$_pkgname.install
source=(https://github.com/mtorromeo/r8168/archive/$pkgver/$_pkgname-$pkgver.tar.gz
        linux-4.5.patch)
sha256sums=('ea22aa1dfda20615f5e114f982f7e61385f871f682eea0c154245760a439abc4'
            'e05a4bccf28beecc97db246064a5fe80d1303476b76086bd262c9c8db82b2e6e')

prepare() {
	cd "$_pkgname-$pkgver"
	patch -p1 -i ../linux-4.5.patch
}

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
