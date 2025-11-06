# Maintainer: Erik Reider <erik.reider@protonmail.com>
pkgname="swayfx-git"
pkgver=r7069.03a07969
pkgrel=4
license=("MIT")
pkgdesc="SwayFX: Sway, but with eye candy!"
makedepends=(
	"git"
	"meson"
	"ninja"
	"scdoc"
	"wayland-protocols"
)
depends=(
	"scenefx-git"
	"cairo"
	"gdk-pixbuf2"
	"libevdev.so"
	"libinput"
	"libjson-c.so"
	"libpixman-1.so"
	"libudev.so"
	"libwayland-server.so"
	"libwlroots-0.19.so"
	"libxcb"
	"libxkbcommon.so"
	"pango"
	"pcre2"
	"ttf-font"
	"xcb-util-wm"
)
optdepends=(
	"brightnessctl: Brightness adjustment tool used in the default configuration"
	"foot: Terminal emulator used in the default configuration"
	"i3status: Status line generation"
	"libpulse: Volume adjustment tool (pactl) used in the default configuration"
	"mako: Lightweight notification daemon"
	"polkit: System privilege control. Required if not using seatd service"
	"swaybg: Wallpaper tool for sway"
	"sway-contrib: Collection of user-contributed scripts for sway"
	"swayidle: Idle management daemon"
	"swaylock: Screen locker"
	"waybar: Highly customizable bar"
	"wmenu: Application launcher used in default config"
	"xorg-xwayland: X11 support"
	"xdg-desktop-portal-gtk: Default xdg-desktop-portal for file picking"
	"xdg-desktop-portal-wlr: xdg-desktop-portal backend"
)
backup=(
	etc/sway/config
	etc/sway/config.d/50-systemd-user.conf
)
arch=("i686" "x86_64")
url="https://github.com/WillPower3309/swayfx"
source=("${pkgname%-*}::git+${url}.git"
	50-systemd-user.conf
	sway-portals.conf)
sha512sums=(
	"SKIP"
	"SKIP"
	"SKIP")
provides=("sway" "swayfx" "wayland-compositor")
conflicts=("sway" "swayfx" "swayfx-git")
install=sway.install

pkgver() {
	cd "swayfx"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export PKG_CONFIG_PATH='/usr/lib/wlroots0.19/pkgconfig'
	arch-meson \
		-D werror=false \
		-D sd-bus-provider=libsystemd \
		-D b_ndebug=true \
		"swayfx" build
	meson compile -C build
}

package() {
	install -Dm644 "swayfx/LICENSE" "$pkgdir/usr/share/licenses/swayfx/LICENSE"
	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
	install -Dm644 sway-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/sway-portals.conf"

	DESTDIR="$pkgdir" meson install -C build
}
