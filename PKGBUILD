# Maintainer: Josip Janzic <me@josip.dev>
# Contributor: Drew DeVault <sir@cmpwn.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=sway-titlebar-positioning-git
_pkgname=sway-titlebar-positioning
pkgver=r7174.363c5798
pkgrel=3
license=("MIT")
pkgdesc="Tiling Wayland compositor and replacement for the i3 window manager patched with config option to have titlebars on the bottom"
makedepends=(
	"git"
	"meson"
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
	"wlroots-git"
	"xorg-server-xwayland"
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
        "titlebar_position.diff::https://github.com/swaywm/sway/compare/master...janza:titlebar-position.diff"
	50-systemd-user.conf)
sha512sums=('SKIP'
            'SKIP'
            '57590bc0d14c87289a4a9cd67991c6a841e54244d2a6186b5da5a08e633de2e8631959fa8c77ede211b0a5f315d920f2c1350951a53d6f2e9e81859056cb3c9e')
provides=("sway")
conflicts=("sway")
options=(debug)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
	cd "$_pkgname"
	patch --forward --strip=1 --input="${srcdir}/titlebar_position.diff"
}

build() {
	arch-meson \
		-Dsd-bus-provider=libsystemd \
		-Dwerror=false \
		"$_pkgname" build
	meson compile -C build
}

package() {
	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"

	DESTDIR="$pkgdir" meson install -C build

        cd "$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_upgrade() {
	echo "Make sure to upgrade wlroots-git and sway-git together."
	echo "Upgrading one but not the other is unsupported."
}
