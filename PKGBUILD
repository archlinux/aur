# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=sway-git
_pkgname=sway
pkgver=r4818.183a4b0d
pkgrel=1
license=("MIT")
pkgdesc="i3-compatible Wayland compositor"
makedepends=("meson" "git" "scdoc" "wayland-protocols")
depends=(
	"json-c" "pcre" "wlroots-git" "wayland" "libxkbcommon" "cairo" "pango"
	"gdk-pixbuf2" "pixman" "libcap" "libinput" "pam" "xorg-server-xwayland"
)
optdepends=(
	"rxvt-unicode: Default terminal emulator."
	"dmenu: Default for launching applications."
	"i3status: To display system information with a bar."
)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=("${pkgname%-*}::git+https://github.com/swaywm/sway.git")
sha1sums=("SKIP")
provides=("sway")
conflicts=("sway")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	rm -rf "$srcdir/build"
	meson -Dwerror=false --prefix /usr "$srcdir/build"
	ninja -C "$srcdir/build"
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="$pkgdir/" ninja -C "$srcdir/build" install
}
