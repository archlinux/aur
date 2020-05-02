# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=sway-no-strip-override-git
_pkgname=sway
pkgver=r5942.3f77591b
pkgrel=1
license=("MIT")
pkgdesc="i3-compatible Wayland compositor (modified PKGBUILD that doesn't override strip to off)"
makedepends=("meson" "git" "scdoc" "wayland-protocols" "ninja")
depends=(
	"json-c" "pcre" "wlroots-git" "cairo" "pango" "gdk-pixbuf2" "pam"
	"xorg-server-xwayland" "swaybg-git"
)
optdepends=(
	"alacritty: Default terminal emulator."
	"dmenu: Default for launching applications."
	"i3status: To display system information with a bar."
	"swayidle-git: Idle management daemon for Sway."
	"swaylock-git: Screen locker for Sway."
)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=("${pkgname%-*}::git+https://github.com/swaywm/sway.git")
sha512sums=('SKIP')
provides=("sway")
conflicts=("sway" "sway-git")
options=(debug)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	meson \
		-Dwerror=false \
		--prefix /usr \
		"$srcdir/build"
	ninja -C "$srcdir/build"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
