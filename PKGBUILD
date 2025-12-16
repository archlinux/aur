# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gx52
pkgver=0.7.6
pkgrel=2
pkgdesc="A GTK application designed to provide control for the LEDs and MFD of Logitech X52 and X52 Pro H.O.T.A.S."
arch=('any')
url="https://gitlab.com/leinardi/gx52"
license=('GPL3')
depends=('gobject-introspection' 'libappindicator-gtk3' 'python' 'python-evdev' 'python-gobject' 'python-injector' 'python-peewee' 'python-pyudev' 'python-pyusb' 'python-reactivex' 'python-requests' 'python-xdg')
makedepends=('meson' 'appstream-glib' 'libudev0' 'libusb')
provides=()
conflicts=()
install="$pkgname.install"
source=("https://gitlab.com/leinardi/gx52/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        '60-gx52.rules')
sha256sums=('4ac373e7bbae7b71085e4d60349c7d9f7a99cdf1c7360c067ce783244f35d068'
            '8239c7529f939f12455a3db5c000e76df9bb77c84f4ed9092ae731c5a1b3ab90')

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
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 "$srcdir/60-gx52.rules" "$pkgdir/usr/lib/udev/rules.d/60-gx52.rules"
}
