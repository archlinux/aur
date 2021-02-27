# Maintainer: Steven Guikal <aur-void@fluix.dev>

pkgname=sway-borders-git
_pkgname=sway-borders
pkgver=r6682.7f4a3e0e
pkgrel=1
license=("MIT")
pkgdesc="Fork of Sway with some additional (mostly graphical) features"
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
	"wlroots-git"
)
optdepends=(
	"alacritty: Terminal emulator used by the default config"
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
source=("${pkgname%-*}::git+https://github.com/fluix-dev/sway-borders.git"
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
	DESTDIR="$pkgdir" meson install -C build
	install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "50-systemd-user.conf" -t "$pkgdir/etc/sway/config.d/"
}
