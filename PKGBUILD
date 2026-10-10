# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz
# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl-git
gitname=dwl
pkgver=r1384.e203845
pkgrel=1
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://codeberg.org/dwl/dwl"
license=('GPL')
depends=('wlroots0.20')
makedepends=('git' 'make' 'wayland-protocols')
optdepends=('xorg-xwayland: for XWayland support')
provides=("$gitname" "wayland-compositor")
conflicts=("$gitname")
# append #branch=wlroots-next to build against wlroots-git
source=('git+https://codeberg.org/dwl/dwl'
        config.h)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	# Use a custom config.h if the file is not empty
	if [ -s "$srcdir/config.h" ]; then
		cp -f "$srcdir/config.h" config.h
	fi
	# Comment the line below to compile without
	# XWayland support
	sed -i -e '/-DXWAYLAND/s/^#//' config.mk
}


build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir/usr/" install
}
