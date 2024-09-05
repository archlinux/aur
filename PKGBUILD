# Maintainer: Bryan Malyn <bim9262@gmail.com>
pkgname=sway-i3-style-fullscreen-git
pkgver=1.10.r7405.af28ac0
pkgrel=1
license=("MIT")
pkgdesc="Tiling Wayland compositor and replacement for the i3 window manager with patch for i3 style fullscreen"
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
	"wayland"
	"wlroots-git"
	"xcb-util-wm"
)
makedepends=(
	"git"
	"libcap"
	"meson"
	"scdoc"
	"wayland-protocols"
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
)
backup=(etc/sway/config)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=("${pkgname}::git+https://github.com/swaywm/sway.git"
	sway-decouple-client-and-container-fullscreen.patch
	50-systemd-user.conf
	sway-portals.conf)
sha512sums=('SKIP'
            '8319fb528f8612d1e501e08cee0fc992a2f3aa81635ae2bce7d238619456c50d4d877cc7aa77fb927f612a0b5d41fd59565b53e1a0564df9922bdcca113824db'
            'c57c473df983402a21ec8f2def2ab4adbdf4b501d78f748e0116360f41a2edfb41d29700236142c7d5df0b61f1646d0758b7fcc6a032740cb820d06f8de925eb'
            '0a34674f8f0086663a5dd05d2229550dbc49b1d5e2db3806668a2424535ef7a4ac436a7fe57e41c29156be41cb515763b93d9f5263d35c6987238c3520f4ce3d')
provides=("sway" "wayland-compositor")
conflicts=("sway")
backup=(
  etc/sway/config
  etc/sway/config.d/50-systemd-user.conf
)
install=sway.install

_meson_setup() {
	arch-meson "$pkgname" "$1" -D sd-bus-provider=libsystemd
}

prepare() {
	patch --forward --strip=1 -d $pkgname --input="${srcdir}/sway-decouple-client-and-container-fullscreen.patch"
	_meson_setup build-pkgver
}

pkgver() {
	(
		set -o pipefail
		meson introspect --projectinfo build-pkgver | sed -n 's/.*"version": "\([^"]*\)".*/\1/;s/-dev//p' | tr -d '\n'
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

	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
	install -Dm644 sway-portals.conf -t "$pkgdir/usr/share/xdg-desktop-portal/"
}
