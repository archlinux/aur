# Maintainer: Nicolas Geniteau <nicolas.geniteau@gmail.com>
pkgname=somebar-git
pkgver=1.0.3.r4.af73bc3
pkgrel=1
pkgdesc="dwm-like bar for dwl"
arch=('x86_64')
url="https://git.sr.ht/~raphi/somebar"
depends=()
makedepends=('git' 'meson' 'wayland-protocols' 'cairo' 'pango')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://git.sr.ht/~raphi/somebar" "config.hpp")
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd "$srcdir/${pkgname%-git}"
	# Use a custom config.hpp if the file is not empty
        if [ -s "$srcdir/config.hpp" ]; then
		cp -f "$srcdir/config.hpp" src/config.hpp
	else
		cp -f src/config.def.hpp src/config.hpp
	fi
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	arch-meson "$srcdir/${pkgname%-git}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
