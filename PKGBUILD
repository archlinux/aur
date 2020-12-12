# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=sway-hidpi-git
_pkgname=sway-hidpi
pkgver=r6539.1dbb6990
pkgrel=2
license=("MIT")
pkgdesc="Tiling Wayland compositor and replacement for the i3 window manager, with XWayland HiDPI (git version)"
makedepends=(
	"git"
	"meson"
	"ninja"
	"scdoc"
	"wayland-protocols"
)
depends=(
	"cairo"
	"gdk-pixbuf2"
	"json-c"
	"pango"
	"polkit"
	"pcre"
	"swaybg-git"
	"ttf-font"
	"wlroots-hidpi-git"
	"xorg-xwayland-hidpi-git"
        "xsettingsd"
)
optdepends=(
	"alacritty: Terminal emulator used by the default config"
	"dmenu: Application launcher"
	"grim: Screenshot utility"
	"i3status: Status line"
	"mako: Lightweight notification daemon"
	"slurp: Select a region"
	"swayidle: Idle management daemon"
	"swaylock: Screen locker"
	"wallutils: Timed wallpapers"
	"waybar: Highly customizable bar"
)
backup=(etc/sway/config)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=("${pkgname%-*}::git+https://github.com/swaywm/sway.git"
        "50-systemd-user.conf"
        "xwayland_hidpi.diff::https://github.com/swaywm/sway/pull/5090.diff")
sha512sums=('SKIP'
            '57590bc0d14c87289a4a9cd67991c6a841e54244d2a6186b5da5a08e633de2e8631959fa8c77ede211b0a5f315d920f2c1350951a53d6f2e9e81859056cb3c9e'
            '813863fe8d391761770eb264b1c0a2d9442efde3e79fae6b78386ed7c041906eef60bbf9d9bc7d118494de8aba2cd4c45a13dcd2ca09f3f1cd1157e74f122667')
provides=("sway")
conflicts=("sway")
options=(debug)

prepare() {
	cd "$_pkgname"
	patch --forward --strip=1 --input="${srcdir}/xwayland_hidpi.diff"
}

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"

	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
		install -Dm755 "contrib/$util" -t "$pkgdir/usr/share/$pkgname/scripts"
	done
}
