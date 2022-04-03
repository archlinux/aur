# Maintainer: Steven Guikal <aur-void@fluix.one>

pkgname=sway-borders-git
_pkgname=sway-borders
pkgver=r6976.8fba9c04
pkgrel=1
license=("MIT")
pkgdesc="Fork of Sway with some additional (mostly graphical) features"
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
url="https://github.com/fluix-dev/sway-borders"
source=("git+$url.git"
        "50-systemd-user.conf")
sha512sums=('SKIP'
            'c2b7d808f4231f318e03789015624fd4cf32b81434b15406570b4e144c0defc54e216d881447e6fd9fc18d7da608cccb61c32e0e1fab2f1fe2750acf812d3137')
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
	DESTDIR="$pkgdir" meson install -C build
	install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "50-systemd-user.conf" -t "$pkgdir/etc/sway/config.d/"

	for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
	install -Dm755 "$_pkgname/contrib/$util" -t \
				   "$pkgdir/usr/share/$pkgname/scripts"
	done
}
