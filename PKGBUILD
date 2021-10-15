# Maintainer: gilbus <aur(AT)tinkershell.eu>
pkgname=cage-scenegraph
_pkgname=cage
pkgver=0.1.4.r16.gf1ba664
pkgrel=1
epoch=1
license=("MIT")
pkgdesc="A Wayland kiosk"
makedepends=("meson" "git" "wayland-protocols")
depends=("wlroots-git" "wayland" "libxkbcommon" "xorg-server-xwayland")
arch=("x86_64")
url="https://www.hjdskes.nl/projects/cage/"
source=("${pkgname%-*}::git+https://github.com/emersion/cage.git#branch=scenegraph")
sha1sums=("SKIP")
provides=("cage")
conflicts=("cage")
options=(debug !strip)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	meson --buildtype=release -Dxwayland=true --prefix /usr "$srcdir/build"
}

build() {
	cd "${srcdir}/${_pkgname}"
	ninja -C "$srcdir/build"
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="$pkgdir/" ninja -C "$srcdir/build" install
}
