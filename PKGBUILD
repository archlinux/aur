# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=sway-git
_pkgname=sway
pkgver=r5747.9032be4f
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
	"swayidle-git: Idle management daemon for Sway."
	"swaylock-git: Screen locker for Sway."
)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=("${pkgname%-*}::git+https://github.com/swaywm/sway.git")
sha1sums=("SKIP")
provides=("sway")
conflicts=("sway")
options=(debug !strip)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	meson -Dwerror=false --prefix /usr "$srcdir/build"
}

build() {
	cd "$_pkgname"
	ninja -C "$srcdir/build"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
