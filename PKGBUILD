# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gkraken
pkgver=1.2.0
pkgrel=1
pkgdesc="GUI that allows to control cooling of NZXT Kraken X (X42, X52, X62 or X72) pumps from Linux"
arch=('any')
url="https://gitlab.com/leinardi/gkraken"
license=('GPL-3.0-or-later')
depends=('gobject-introspection' 'libappindicator-gtk3' 'liquidctl' 'python' 'python-cairo' 'python-gobject' 'python-hidapi' 'python-injector' 'python-matplotlib' 'python-peewee' 'python-psutil' 'python-pyxdg' 'python-requests' 'python-rx')
makedepends=('meson' 'appstream-glib')
provides=()
conflicts=()
install="$pkgname.install"
source=("https://gitlab.com/leinardi/gkraken/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        '60-gkraken.rules')
sha256sums=('b0fca3d5c4728344942aaf304acbc8f1b92884276ca0979080c4171ea5ef0872'
            'fccd2b7d1bfbee559dbd9bf62c9ab09784013bf86d9dd58558268fcf0cb195af')

build() {
	if [[ -d "$srcdir/build" ]]; then
		rm -rf "$srcdir/build"
	fi
	meson --prefix /usr --buildtype=plain "$pkgname-$pkgver" build
	ninja -C build
}

check() {
	ninja -C build test
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 "60-gkraken.rules" "${pkgdir}/usr/lib/udev/rules.d/60-gkraken.rules"
}
