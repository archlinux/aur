# Maintainer: Thomas Lam <thomas@lamcw.com>

pkgname=oguri-git
pkgver=r52.59a5175
pkgrel=2
pkgdesc="A very nice animated wallpaper tool for Wayland compositors."
arch=('i686' 'x86_64')
url="https://github.com/vilhalmer/oguri"
license=('MIT')
groups=()
depends=('gtk3' 'wayland')
makedepends=('git' 'meson')
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
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
