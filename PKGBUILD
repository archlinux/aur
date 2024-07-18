# Maintainer: Erik Reider <erik.reider@protonmail.com>
_pkgname=swayfx
pkgname="$_pkgname-git"
pkgver=r7047.8ad2605c
pkgrel=1
license=("MIT")
pkgdesc="SwayFX: Sway, but with eye candy!"
makedepends=(git meson ninja scdoc setconf wayland-protocols)
depends=(
	"cairo"
	"gdk-pixbuf2"
	"libevdev.so"
	"libinput"
	"scenefx-git"
	"libjson-c.so"
	"libpixman-1.so"
	"libudev.so"
	"libwayland-server.so"
	"libwlroots.so"
	"libxcb"
	"libxkbcommon.so"
	"pango"
	"pcre2"
	"ttf-font"
	"xcb-util-wm"
)
optdepends=(
	"dmenu: dmenu_path support (used alongside wmenu in default $menu)"
	"foot: Terminal emulator used in the default configuration"
	"i3status: Status line generation"
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
provides=("sway" "swayfx")
conflicts=("sway" "swayfx" "swayfx-git")
options=(debug)
install=sway.install

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson \
		-Dwerror=false \
		-Dsd-bus-provider=libsystemd \
		"$_pkgname" build
	meson compile -C build
}

package() {
	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
	install -Dm644 sway-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/sway-portals.conf"

	DESTDIR="$pkgdir" meson install -C build
}
