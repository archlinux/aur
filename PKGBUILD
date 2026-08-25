# Maintainer: eNV25 <env252525@gmail.com>

pkgname=gnome-shell-extension-albumwm-git
pkgver=50.0.r3756.f1efeaa
pkgrel=1
pkgdesc="Scrollable tiling extension for GNOME Shell"
arch=('any')
url="https://albumwm.0iq.dev"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('git' 'npm' 'blueprint-compiler' 'glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/poli0iq/albumwm.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/albumwm"
	printf "%s.r%s.%s" \
		"$(grep -Po '"version"\s*:\s*"\K[^"]+' package.json)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/albumwm"
	npm install --no-audit --no-fund
	npm run build
}

package() {
	cd "$srcdir/albumwm"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
	mv dist/ "$pkgdir/usr/share/gnome-shell/extensions/albumwm@0iq.dev"
	mkdir -p "$pkgdir/usr/share/glib-2.0/"
	mv -t "$pkgdir/usr/share/glib-2.0/" "$pkgdir/usr/share/gnome-shell/extensions/albumwm@0iq.dev/schemas/"
}
