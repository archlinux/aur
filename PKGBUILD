# Maintainer: Thomas Lam <thomas@lamcw.com>

pkgname=oguri-git
pkgver=r96.518baf2
pkgrel=1
pkgdesc="A very nice animated wallpaper tool for Wayland compositors."
arch=('i686' 'x86_64')
url="https://github.com/vilhalmer/oguri"
license=('MIT')
groups=()
depends=('cairo' 'gdk-pixbuf2' 'wayland')
makedepends=('git' 'meson' 'wayland-protocols')
optdepends=('sway: Wayland compositor to display wallpaper in.')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-*}::git+https://github.com/vilhalmer/oguri.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	meson -Dwerror=false --prefix /usr "$srcdir/build"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	ninja -C "$srcdir/build"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
	install -D -m755 contrib/oguri-swaybg $pkgdir/usr/bin/oguri-swaybg
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
