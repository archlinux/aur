# Maintainer: Erik Reider <erik.reider@protonmail.com>
pkgname="swayfx-git"
pkgver=r7069.03a07969
pkgrel=2
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
	"cairo"
	"gdk-pixbuf2"
	"libevdev.so"
	"libinput"
	"libscenefx-0.3.so"
	"libjson-c.so"
	"libpixman-1.so"
	"libudev.so"
	"libwayland-server.so"
	"libwlroots-0.18.so"
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
	"d5f9aadbb4bbef067c31d4c8c14dad220eb6f3e559e9157e20e1e3d47faf2f77b9a15e52519c3ffc53dc8a5202cb28757b81a4b3b0cc5dd50a4ddc49e03fe06e"
	"4f9576b7218aef8152eb60e646985e96b13540b7a4fd34ba68fdc490199cf7a7b46bbee85587e41bffe81fc730222cf408d5712e6251edc85a0a0b0408c1a2df")
provides=("sway" "swayfx" "wayland-compositor")
conflicts=("sway" "swayfx" "swayfx-git")
options=(debug)
install=sway.install

pkgver() {
	cd "swayfx"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export PKG_CONFIG_PATH='/usr/lib/wlroots0.17/pkgconfig'
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
