# Maintainer: tmpm697

pkgname=swea-git
_pkgname=swea
pkgver=r6689.b49a3c72
pkgrel=1
license=("MIT")
pkgdesc="Sway with PRs"
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
	"foot: Terminal emulator used by the default config"
	"dmenu: Application launcher"
	"grim: Screenshot utility"
	"i3status: Status line"
	"mako: Lightweight notification daemon"
	"slurp: Select a region"
	"swayidle-git: Idle management daemon for Sway"
	"swaylock-git: Screen locker for Sway"
	"wallutils: Timed wallpapers"
	"waybar: Highly customizable bar"
	"xorg-xwayland: X11 support"
)
backup=(etc/sway/config)
arch=("i686" "x86_64")
url="https://github.com/tmpm697/Swea"
source=("${pkgname%-*}::git+https://github.com/tmpm697/Swea.git"
        "50-systemd-user.conf")
sha512sums=('SKIP'
            '57590bc0d14c87289a4a9cd67991c6a841e54244d2a6186b5da5a08e633de2e8631959fa8c77ede211b0a5f315d920f2c1350951a53d6f2e9e81859056cb3c9e')
provides=("sway")
conflicts=("sway")
options=(debug)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
		install -Dm755 "contrib/$util" -t "$pkgdir/usr/share/$pkgname/scripts"
	done
}

post_upgrade() {
	echo "NOTE1: Make sure to upgrade wlroots-git and sway-git together."
	echo "NOTE2: Upgrading one but not the other is unsupported."
}
