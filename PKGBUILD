# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Bob Fanger < bfanger(at)gmail >
# Contributor: Filip <fila pruda com>, Det < nimetonmaili(at)gmail >
# PF ver   : wangjiezhe <wangjiezhe AT yandex DOT com>

_pkgname=r8168
pkgname=r8168-pf
pkgver=8.041.00
pkgrel=4
pkgdesc="A kernel module for Realtek 8168 network cards(pf kernel)"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'linux-pf')
makedepends=('linux-pf-headers')
install=$_pkgname.install
source=("$_pkgname-$pkgver.tar.gz"::"https://github.com/mtorromeo/r8168/archive/$pkgver.tar.gz"
       "linux-4.5.patch")
sha256sums=('d56f60e4157ccbf8f8717270b1acb391b0a959d9a96c2f0b4a91c683aa8b83a5'
            'e05a4bccf28beecc97db246064a5fe80d1303476b76086bd262c9c8db82b2e6e')

prepare() {
	cd "$_pkgname-$pkgver"
	patch -p1 -i ../linux-4.5.patch
}

build() {
	_kernver=$(pacman -Q linux-pf | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-pf/version)

	cd "$_pkgname-$pkgver"

	# avoid using the Makefile directly -- it doesn't understand
	# any kernel but the current.
	make -C /usr/lib/modules/$KERNEL_VERSION/build \
			SUBDIRS="$srcdir/$_pkgname-$pkgver/src" \
			EXTRA_CFLAGS="-DCONFIG_R8168_NAPI -DCONFIG_R8168_VLAN" \
			modules
}

package() {
	_kernver=$(pacman -Q linux-pf | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	depends=("linux-pf>=$_kernver" "linux-pf<${_kernver/.*}.$(expr ${_kernver/*.} + 1)")
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-pf/version)
	msg "Kernel = $KERNEL_VERSION"

	cd "$_pkgname-$pkgver"
	install -Dm644 src/$_pkgname.ko "$pkgdir/usr/lib/modules/extramodules-$_kernver-pf/$_pkgname.ko"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +

	sed -i "s|extramodules-.*-pf|extramodules-$_kernver-pf|" "$startdir/$_pkgname.install"
}
