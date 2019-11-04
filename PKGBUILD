# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gottengeography
pkgver=2.5
_gitrev=dd98beb826da62f430d51749dfa340af3620053c
pkgrel=8
pkgdesc='Easy to use photo geotagging application for the GNOME desktop'
arch=('any')
url='https://launchpad.net/gottengeography'
license=('GPL3')
depends=('libchamplain' 'libgexiv2' 'python-dateutil' 'python-gobject')
makedepends=('python-distutils-extra')
source=($pkgname-$pkgver.tar.gz::https://git.launchpad.net/gottengeography/snapshot/$pkgname-$_gitrev.tar.gz
        gottengeography.appdata.xml
        fixes.patch
        fix-show-uri.patch
        remove-mapquest.patch)
sha256sums=('510e6cb9d2e5ca5f103d8b5c0203a4d6e7f886cf5213aff907d99bd3f726b000'
            '8cf14124c72dd6213254ce0f3a8404916f30f2bd9b9350530760d77825632d75'
            'e0f2115a1bbc6fefd60d3018567180a69cf9e502ecef8d92cb525b5fda8f1351'
            '5a930bb0a8d04d67659345570e4b96c0e36f673eb6cc32708cf670a58cb60a43'
            'a7dd2cd240ee10c99efc92baeec177f9635d0d1f23e24d3ae0d50d9907834688')

prepare() {
	cd $pkgname-$_gitrev

	# Various fixes
	patch -Np1 -i ../fixes.patch

	# Don't crash if Gtk.show_uri fails
	patch -Np1 -i ../fix-show-uri.patch

	# Remove discontinued MapQuest service
	patch -Np1 -i ../remove-mapquest.patch
}

build() {
	cd $pkgname-$_gitrev
	python setup.py build
}

package() {
	cd $pkgname-$_gitrev
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 ../gottengeography.appdata.xml "$pkgdir/usr/share/metainfo/gottengeography.appdata.xml"
}
