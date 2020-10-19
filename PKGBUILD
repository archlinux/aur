# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=sway-no-strip-override-git
_pkgname=sway
pkgver=1.5.rc2.r79.cc8d318a
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
source=(
	"${_pkgname%-*}::git+https://github.com/swaywm/sway.git"
	"50-systemd-user.conf"
)
sha512sums=(
	'SKIP'
	'57590bc0d14c87289a4a9cd67991c6a841e54244d2a6186b5da5a08e633de2e8631959fa8c77ede211b0a5f315d920f2c1350951a53d6f2e9e81859056cb3c9e'
)
provides=("sway")
conflicts=("sway" "sway-git")
options=(debug)

pkgver() {
	cd "$_pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	arch-meson \
		-Dwerror=false \
		"$srcdir/build"
	ninja -C "$srcdir/build"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
	install -Dm644 "$srcdir/50-systemd-user.conf" -t "$pkgdir/etc/sway/config.d/"
}
