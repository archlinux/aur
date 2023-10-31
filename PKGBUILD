# Maintainer: 33KK <marko@pepega.club>
# Contributor: GreyXor <greyxor@protonmail.com>
# Contributor: Drew DeVault <sir@cmpwn.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>

_pkgname=sway
pkgname="${_pkgname}-persistent-workspaces-git"
pkgver=r7201.7efbd8e2
pkgrel=1
arch=('x86_64')
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager (fork with persistent workspaces)'
url='https://code.pepega.club/33KK/sway/src/branch/persistent-workspaces'
license=('MIT')
depends=(
	"cairo"
	"gdk-pixbuf2"
	"glib2"
	"glibc"
	"json-c"
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
	'xorg-xwayland: X11 support'
)
install=sway.install
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/sway/config")
source=("${_pkgname}::git+https://code.pepega.club/33KK/sway.git"
	"50-systemd-user.conf")
b2sums=('SKIP'
        'SKIP')

pkgver() {
	# Calculate the version dynamically using git information
	printf "r%s.%s" "$(git -C "$srcdir/${_pkgname}" rev-list --count HEAD)" "$(git -C "$srcdir/${_pkgname}" rev-parse --short HEAD)"
}

build() {
	arch-meson "${_pkgname}" build -D sd-bus-provider=libsystemd -D werror=false

	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
	install -Dm644 "${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
