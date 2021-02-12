# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Jeffrey Bouter <aur at kn0x dot org>
pkgname=touche
pkgver=1.0.2
pkgrel=1
pkgdesc="The desktop application to configure Touchégg "
arch=('x86_64')
url="https://github.com/JoseExposito/touche"
license=('GPL3')
depends=('gjs' 'gtk3' 'libwnck3' 'touchegg')
makedepends=('meson' 'npm' 'appstream-glib')
checkdepends=('appstream' 'desktop-file-utils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b1e82204bfb5e2181c8213e4fc2cd16ebd3e2da5a3fc3eaf647808ca515183ae')

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
