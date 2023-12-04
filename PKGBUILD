# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Drew DeVault <sir@cmpwn.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>

pkgname=sway-asan-git
pkgver=r7218.f12023b1
pkgrel=1
arch=('x86_64')
pkgdesc="Tiling Wayland compositor and replacement for the i3 window manager (with address sanitizer)"
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
	'swaybg: Wallpaper tool for sway'
	'swayidle: Idle management daemon'
	'swaylock: Screen locker'
	'xorg-xwayland: X11 support'
)
install=sway-git.install
provides=("${pkgname%-asan-git}" "${pkgname/-asan/}=${pkgver}")
conflicts=("${pkgname%-asan-git}" "${pkgname/-asan/}")
backup=("etc/sway/config")
source=("${pkgname}::git+https://github.com/swaywm/sway.git"
	"50-systemd-user.conf"
	"0001-asan-options.patch")
b2sums=('SKIP'
        '95e0862807c3b5bb490b88c46e6d2d4deaa8ba0d18be0c169f3d57606acbfa124cb712b48b22ab6f12f247ac5b8d5d3cf4db85f7b04420845c0e3ed742edf917'
        '30efac9b5d06babb8ee9b35a25887b403d9e0e0a81078841d3837e075ce84a3a8aa93cbdd156db092c333b9b98e4ce3fd1ab40078ac1a90e243f1e24b9ebf5be')

pkgver() {
	# Calculate the version dynamically using git information
	printf "r%s.%s" "$(git -C "$srcdir/${pkgname}" rev-list --count HEAD)" "$(git -C "$srcdir/${pkgname}" rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	for f in "$srcdir"/*.patch; do
		patch -p1 < "$f"
	done
}

build() {
	CFLAGS="$CFLAGS -fsanitize=address,undefined" arch-meson "${pkgname}" build -D sd-bus-provider=libsystemd -D werror=false

	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
	install -Dm644 "${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
