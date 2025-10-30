# Maintainer: dawsers <dawser at gmx dot com>
pkgname=sway-scroll-git
pkgver=1.12.r7546.c33803e
pkgrel=7
pkgdesc='Fork of the sway Wayland compositor with a scrolling layout like PaperWM or niri (git development version)'
arch=('x86_64')
url="https://github.com/dawsers/scroll"
license=("MIT")
depends=(
	"cairo"
	"gdk-pixbuf2"
	"json-c"
	"libdrm"
	"libevdev"
	"libinput"
	"libxcb"
	"libxkbcommon"
	"pango"
	"pcre2"
	"pixman"
	"wayland"
	"xcb-util-wm"
	"lua"
	"glibc"
	"libliftoff"
	"libglvnd"
	"lcms2"
	"systemd-libs"
	"opengl-driver"
	"xcb-util-errors"
	"xcb-util-renderutil"
	"xcb-util-wm"
	"seatd"
	"glslang"
	"vulkan-icd-loader"
	"libdisplay-info"
)
makedepends=(
	"git"
	"libcap"
	"meson"
	"scdoc"
	"wayland-protocols"
	"vulkan-headers"
	"xorgproto"
	"xorg-xwayland"
)
optdepends=(
	'wmenu: Application launcher used in default configuration'
	'foot: Terminal emulator used in default configuration'
	'polkit: System privilege control. Required if not using seatd service'
	'swaybg: Wallpaper tool for sway'
	'swayidle: Idle management daemon'
	'swaylock: Screen locker'
	'xdg-desktop-portal-gtk: Portal used for default file picking'
	'xdg-desktop-portal-wlr: Portal used for screen sharing'
	'xorg-xwayland: Enable X11 support'
)
provides=("sway-scroll-git" "wayland-compositor")
conflicts=("sway-scroll-stable")
install="${pkgname}.install"
source=("${pkgname}::git+${url}.git"
	"50-systemd-user.conf"
	"scroll-portals.conf")
b2sums=('SKIP'
        '9f913e2262718289e4d1e9e77420617e15c682d3c9006627ea119ba8df19e3ffe6db0fe2610d9fb32daa96c361544faed334321ea35685a11241bed45ffd7958'
        'cdba5fd2988b7ead8b264d5b41f1c7adb47a6487be1e3a4ce98c0af2094d9964f4bc364237c4437014be18061f067aa741b0382f21365be497e06b189c5c7728')

_meson_setup() {
	arch-meson "$pkgname" "$1" -D sd-bus-provider=libsystemd
}

prepare() {
	_meson_setup build-pkgver
}

pkgver() {
	(
		set -o pipefail
		meson introspect --projectinfo build-pkgver | sed -n 's/.*{"version": "\([^"]*\)".*/\1/;s/-dev//p' | tr -d '\n'
	)
	cd "$pkgname"
	printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	_meson_setup build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/scroll/config.d/"
	install -Dm644 scroll-portals.conf -t "$pkgdir/usr/share/xdg-desktop-portal/"
}
