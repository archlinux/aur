# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=touche
pkgver=1.0.3
pkgrel=1
pkgdesc="The desktop application to configure Touchégg "
arch=('x86_64')
url="https://github.com/JoseExposito/touche"
license=('GPL3')
depends=('gjs' 'gtk3' 'libwnck3' 'touchegg')
makedepends=('meson' 'npm' 'appstream-glib')
checkdepends=('appstream' 'desktop-file-utils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('aa044fa99b777ec97b9df9441846056c3a67e3d6f9e31a34acc01056a1cb96a3')

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
