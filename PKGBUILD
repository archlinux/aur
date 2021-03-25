# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=touche
pkgver=1.0.4
pkgrel=1
pkgdesc="The desktop application to configure Touchégg "
arch=('x86_64')
url="https://github.com/JoseExposito/touche"
license=('GPL3')
depends=('gjs' 'gtk3' 'libwnck3' 'touchegg')
makedepends=('gobject-introspection' 'meson' 'npm')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d99e3ee7320af900c7a34b4a3a4cc4c0c4f7109c911e2b00cf382749fed61c18')

build() {
	export npm_config_cache="$srcdir/npm_cache"

	cd "$pkgname-$pkgver"
	npm install

	arch-meson -Dtarget-de=gnome . build
	meson compile -C build
}

check() {
	cd "$pkgname-$pkgver"
	meson test -C build --print-errorlogs
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" meson install -C build

	ln -s "/usr/bin/com.github.joseexposito.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
