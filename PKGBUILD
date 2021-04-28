# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=touche
pkgver=1.0.5
pkgrel=1
pkgdesc="The desktop application to configure Touchégg "
arch=('x86_64')
url="https://github.com/JoseExposito/touche"
license=('GPL3')
depends=('gjs' 'gtk3' 'touchegg')
makedepends=('gobject-introspection' 'meson' 'npm')
checkdepends=('appstream-glib')
provides=('libtouche.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e8979333dd176715b0c51e2193bce73b3f06cf63eb7d78fc0a8d47f2cd8c7563')

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
