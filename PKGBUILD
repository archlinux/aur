# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Drew DeVault <sir@cmpwn.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>

pkgname=sway-git
pkgver=r7181.89f85312
pkgrel=1
arch=('x86_64')
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
url='https://swaywm.org'
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
	'swaybg-git: Wallpaper tool for sway'
	'swayidle-git: Idle management daemon'
	'swaylock-git: Screen locker'
	'xorg-xwayland: X11 support'
)
install=sway-git.install
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/sway/config")
source=("${pkgname}::git+https://github.com/swaywm/sway.git"
	"50-systemd-user.conf")
b2sums=('SKIP'
        '95e0862807c3b5bb490b88c46e6d2d4deaa8ba0d18be0c169f3d57606acbfa124cb712b48b22ab6f12f247ac5b8d5d3cf4db85f7b04420845c0e3ed742edf917')

pkgver() {
	# Calculate the version dynamically using git information
	printf "r%s.%s" "$(git -C "$srcdir/${pkgname}" rev-list --count HEAD)" "$(git -C "$srcdir/${pkgname}" rev-parse --short HEAD)"
}

build() {
	arch-meson "${pkgname}" build -D sd-bus-provider=libsystemd -D werror=false

	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
	install -Dm644 "${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
