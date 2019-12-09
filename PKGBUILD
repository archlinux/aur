# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=sway-xdg-shell-v6-git
_pkgname=sway-xdg-shell-v6
pkgver=r6136.b739bf10
pkgrel=1
license=("MIT")
pkgdesc="i3-compatible Wayland compositor (with xdg-shell-v6 unstable protocol)"
makedepends=("meson" "git" "scdoc" "wayland-protocols" "ninja")
depends=(
	"json-c" "pcre" "wlroots-git" "cairo" "pango" "gdk-pixbuf2" "pam"
	"xorg-server-xwayland" "swaybg-git"
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
sha512sums=('SKIP')
provides=("sway")
conflicts=("sway")
options=(debug !strip)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
  # Revert "Remove xdg-shell v6 support"
  git revert --no-edit 7488d33d42cfc29c5fbeb02888b1d718bd84d4d0
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
