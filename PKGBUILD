# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl-git
pkgver=0.3.1.r27.d969289
pkgrel=1
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://github.com/djpohly/dwl"
license=('GPL')
depends=('wlroots>=0.13')
makedepends=('git' 'wayland-protocols')
optdepends=('xorg-xwayland: for XWayland support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# append #branch=wlroots-next to build against wlroots-git
source=('git+https://github.com/djpohly/dwl'
        config.h)
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd "$srcdir/${pkgname%-git}"
	# Use a custom config.h if the file is not empty
	if [ -s "$srcdir/config.h" ]; then
		cp -f "$srcdir/config.h" config.h
	fi
	# Uncomment to compile with XWayland support
	#sed -i -e '/-DXWAYLAND/s/^#//' config.mk
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir/usr/" install
}
