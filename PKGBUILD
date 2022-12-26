# Maintainer: Drew DeVault <sir@cmpwn.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=sway-asan-git
_pkgname=sway
pkgver=r7040.bd7466e1
pkgrel=1
license=("MIT")
pkgdesc="Tiling Wayland compositor and replacement for the i3 window manager (with address sanitizer)"
makedepends=(
    "git"
    "meson"
    "scdoc"
    "wayland-protocols"
)
depends=(
    "cairo"
    "gdk-pixbuf2"
    "json-c"
    "pango"
    "polkit"
    "pcre2"
    "swaybg-git"
    "ttf-font"
    "wlroots-git"
    "xorg-server-xwayland"
)
optdepends=(
    "alacritty: Terminal emulator used by the default config"
    "dmenu: Application launcher"
    "grim: Screenshot utility"
    "i3status: Status line"
    "mako: Lightweight notification daemon"
    "slurp: Select a region"
    "swayidle: Idle management daemon"
    "swaylock: Screen locker"
    "wallutils: Timed wallpapers"
    "waybar: Highly customizable bar"
)
backup=(etc/sway/config)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=(
    "${pkgname%-asan-*}::git+https://github.com/swaywm/sway.git"
    50-systemd-user.conf
    0001-asan-options.patch
)
sha512sums=('SKIP'
            'c2b7d808f4231f318e03789015624fd4cf32b81434b15406570b4e144c0defc54e216d881447e6fd9fc18d7da608cccb61c32e0e1fab2f1fe2750acf812d3137'
            '9e24967087b7e062b77e735260c4b30cd8dcf77c03358e658ec854b8387d66310c99d93fde11ec00de45073e949a1df0c4c721d765e62944ae227913b667be6e')
provides=("sway" "sway-git=${pkgver}")
conflicts=("sway")
options=(debug)
install=sway.install

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
    for f in "$srcdir"/*.patch; do
		patch -p1 < "$f"
	done
}

build() {
	CFLAGS="$CFLAGS -fsanitize=address,undefined" arch-meson \
		-Dsd-bus-provider=libsystemd \
		-Dwerror=false \
		"$_pkgname" build
	meson compile -C build
}

package() {
	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"

	DESTDIR="$pkgdir" meson install -C build

        cd "$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
		install -Dm755 "contrib/$util" -t "$pkgdir/usr/share/$pkgname/scripts"
	done
}

post_upgrade() {
	echo "Make sure to upgrade wlroots-git and sway-git together."
	echo "Upgrading one but not the other is unsupported."
}
