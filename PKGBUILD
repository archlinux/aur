# Maintainer: gilbus <aur(AT)tinkershell.eu>
pkgname=swaylock-git
_pkgname=swaylock
pkgver=r187.4e72a36
pkgrel=1
license=("MIT")
pkgdesc="Screen locker for Wayland "
makedepends=("meson" "git" "scdoc" "wayland-protocols")
depends=(
	"wayland" "libxkbcommon" "pango" "cairo" "pam"
)
optdepends=(
	"gdk-pixbuf2: For background images other than PNG"
)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=("${pkgname%-*}::git+https://github.com/swaywm/swaylock.git")
sha1sums=("SKIP")
provides=("swaylock")
conflicts=("swaylock")
options=(debug !strip)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	# Fix ticket FS#31544, sed line taken from gentoo
	sed -i -e 's:login:system-auth:' pam/swaylock.linux
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
