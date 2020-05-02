# Maintainer: Drew DeVault <sir@cmpwn.com>
# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=sway-hidpi-git
_pkgname=sway-hidpi
pkgver=r6341.ae3ec745
pkgrel=1
license=("MIT")
pkgdesc="i3-compatible Wayland compositor, with XWayland HiDPI"
makedepends=("meson" "git" "scdoc" "wayland-protocols" "ninja")
depends=(
	"json-c" "pcre" "wlroots-hidpi-git" "cairo" "pango" "gdk-pixbuf2" "pam"
	"xorg-server-xwayland-hidpi-git" "swaybg-git" "xsettingsd"
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
source=("${pkgname%-*}::git+https://github.com/swaywm/sway.git"
        "https://github.com/swaywm/sway/pull/5090.diff")
sha512sums=('SKIP'
            'SKIP')
provides=("sway")
conflicts=("sway")
options=(debug !strip)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	patch -Np1 -i ../5090.diff
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
