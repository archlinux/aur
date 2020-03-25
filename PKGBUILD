# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Laramy Black <laramy2020@gmail.com>
pkgname=nuvolaruntime
pkgver=4.16.0
pkgrel=1
pkgdesc="Nuvola Apps Runtime - Tight integration of web apps with your desktop"
arch=('any')
url="https://nuvola.tiliado.eu"
license=('BSD 2-Clause "Simplified"')
depends=("diorite=$pkgver" 'python-gobject' 'json-glib' 'webkit2gtk' 'libnotify'
         'gst-plugins-ugly' 'libdri2' 'libdrm' 'libsecret')
makedepends=('git' 'waf' 'valacef')
optdepends=('libappindicator-gtk3: Tray icon support'
            'engine.io-client'
            'unit.js: for JavaScript unit tests')
provides=('nuvolaplayer')
conflicts=('nuvolaplayer')
source=("https://github.com/tiliado/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=()

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's|usr/share/vala-0\.36|usr/share/vala-0.46|g' \
		vapi/webkit2gtk-web-extension-4.0.patch vapi/glib-2.0.patch wscript
}

build() {
	cd "$pkgname-$pkgver"
	waf configure \
		--prefix=/usr \
		--libdir=/usr/lib \
		--no-vala-lint \
		--no-js-lint \
		--no-unity \
		--no-appindicator
	waf build
}

check() {
	cd "$pkgname-$pkgver"
	LD_LIBRARY_PATH=./build ./build/run-dioritetests
}

package() {
	cd "$pkgname-$pkgver"
	waf install --destdir="$pkgdir"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
