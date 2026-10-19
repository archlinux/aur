# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Drew DeVault <sir@cmpwn.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=sway-git
pkgver=1.13.r7704.1652c54
pkgrel=1
pkgdesc='Tiling Wayland compositor and replacement for i3 (git development version)'
arch=('x86_64')
url="https://github.com/swaywm/sway"
license=("MIT")
depends=(
	"cairo"
	"gdk-pixbuf2"
	"glib2"
	"glibc"
	"json-c"
	"libdrm"
	"libevdev"
	"libinput"
	"libxcb"
	"libxkbcommon"
	"pango"
	"pcre2"
	"pixman"
	"systemd-libs"
	"ttf-font"
	"wayland"
	"wlroots-git"
	"xcb-util-wm"
)
makedepends=(
	"git"
	"meson"
	"scdoc"
	"wayland-protocols"
)
optdepends=(
	'brightnessctl: Brightness adjustment tool used in default configuration'
	'foot: Terminal emulator used in default configuration'
	'grim: Screenshot utility used in default configuration'
	'libpulse: Volume adjustment tool (pactl) used in default configuration'
	'playerctl: Media player controller used in default configuration'
	'polkit: System privilege control. Required if not using seatd service'
	'swaybg: Wallpaper tool used in default configuration'
	'swayidle: Idle management daemon'
	'swaylock: Screen locker'
	'wmenu: Application launcher used in default configuration'
	'xdg-desktop-portal-gtk: Portal used for default file picking'
	'xdg-desktop-portal-wlr: Portal used for screen sharing'
	'xorg-xwayland: X11 support'
)
provides=("${pkgname%-git}=${pkgver}" "wayland-compositor")
conflicts=("${pkgname%-git}")
backup=(
	etc/sway/config
	etc/sway/config.d/50-systemd-user.conf
)
install="${pkgname}.install"
source=("${pkgname}::git+${url}.git"
	"50-systemd-user.conf"
	"sway-portals.conf")
b2sums=('SKIP'
        '71f45f9abb4e9f98a52177b227aa30ab27d02c9eef8a31400460e71c72b6d40ec396581f0b1703d4cec655aaba704077212882f643c6efb6cda951ea69b5383d'
        'cdba5fd2988b7ead8b264d5b41f1c7adb47a6487be1e3a4ce98c0af2094d9964f4bc364237c4437014be18061f067aa741b0382f21365be497e06b189c5c7728')

pkgver() {
	cd "${pkgname}"
	local ver
	ver=$(meson introspect --projectinfo meson.build 2>/dev/null |
		python -c 'import json, sys; print(json.load(sys.stdin)["version"].split("-")[0])') || return
	printf '%s.r%s.%s' "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	arch-meson "${pkgname}" build \
		-D sd-bus-provider=libsystemd \
		-D werror=false
	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"

	install -Dm644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 50-systemd-user.conf -t "${pkgdir}/etc/sway/config.d/"
	install -Dm644 sway-portals.conf -t "${pkgdir}/usr/share/xdg-desktop-portal/"
}
