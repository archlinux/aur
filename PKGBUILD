# Maintainer: Bryan Malyn <bim9262@gmail.com>
pkgname=sway-i3-style-fullscreen-git
_pkgname=sway
pkgver=r7173.bb91b7f5
pkgrel=1
license=("MIT")
pkgdesc="Tiling Wayland compositor and replacement for the i3 window manager with patch for i3 style fullscreen"
makedepends=(
	"git"
	"meson"
	"scdoc"
	"wayland-protocols"
	"jq"
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
source=("${_pkgname}::git+https://github.com/swaywm/sway.git"
	"https://gist.githubusercontent.com/bim9262/0f63e6b5d8107d7d2654b61e0b7debe2/raw/6837fc0d7e91d0f0a7449c5b36ac1da4469b591b/sway-decouple-client-and-container-fullscreen.patch"
	50-systemd-user.conf)
sha512sums=('SKIP'
            '8319fb528f8612d1e501e08cee0fc992a2f3aa81635ae2bce7d238619456c50d4d877cc7aa77fb927f612a0b5d41fd59565b53e1a0564df9922bdcca113824db'
            'c2b7d808f4231f318e03789015624fd4cf32b81434b15406570b4e144c0defc54e216d881447e6fd9fc18d7da608cccb61c32e0e1fab2f1fe2750acf812d3137')
provides=("sway")
conflicts=("sway")
options=(debug)
install=sway.install

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    patch --forward --strip=1 --input="${srcdir}/sway-decouple-client-and-container-fullscreen.patch"
}

build() {
	arch-meson \
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
}

post_upgrade() {
	echo "Make sure to upgrade wlroots-git and sway-git together."
	echo "Upgrading one but not the other is unsupported."
}
