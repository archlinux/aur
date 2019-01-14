# Maintainer: gilbus <aur(AT)tinkershell.eu>
pkgname=swaylock-git
_pkgname=swaylock
pkgver=r152.aab44df
pkgrel=1
license=("MIT")
pkgdesc="Screen locker for Wayland "
makedepends=("meson" "git" "scdoc" "wayland-protocols")
depends=(
	"wayland" "wlroots-git" "pango" "cairo" "pam"
)
optdepends=(
	"gdk-pixbuf2: For background images other than PNG"
)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=("${pkgname%-*}::git+https://github.com/swaywm/swaylock.git")
sha1sums=("SKIP")
provides=("swaylock")
#conflicts=("swaylock")
options=(debug !strip)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	meson -Dwerror=false --prefix /usr "$srcdir/build"
}

build() {
	cd "${srcdir}/${_pkgname}"
	ninja -C "$srcdir/build"
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="$pkgdir/" ninja -C "$srcdir/build" install
}
