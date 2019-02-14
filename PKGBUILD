# Maintainer: gilbus <aur(AT)tinkershell.eu>
pkgname=cage-git
_pkgname=cage
pkgver=r83.f0eb115
pkgrel=1
license=("MIT")
pkgdesc="A Wayland kiosk"
makedepends=("meson" "git" "wayland-protocols")
depends=(
	"wlroots-git" "wayland" "libxkbcommon" "xorg-server-xwayland"
)
arch=("x86_64")
url="https://hjdskes.nl/projects/cage"
source=("${pkgname%-*}::git+https://github.com/Hjdskes/cage.git")
sha1sums=("SKIP")
#provides=("cage")
#conflicts=("cage")
options=(debug !strip)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
