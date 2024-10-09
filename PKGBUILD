# Maintainer: Arnaud Gissinger (contact: mathix.dev)
_pkgname="swayfx-i3-style-fullscreen"
pkgname="$_pkgname-2-git"
pkgver=r7062.ef080851
pkgrel=2
license=("MIT")
pkgdesc="SwayFX: Sway, but with eye candy!"
makedepends=(
	"git"
	"meson"
	"scdoc"
	"wayland-protocols"
)
depends=(
	"cairo"
	"gdk-pixbuf2"
	"libevdev.so"
	"libinput"
	"libjson-c.so"
	"libudev.so"
	"libwayland-server.so"
	"libxcb"
	"libxkbcommon.so"
	"pango"
	"pcre2"
	"ttf-font"
	"libscenefx.so"
	"wlroots0.17"
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
	"xdg-desktop-portal-gtk: Default xdg-desktop-portal for file picking"
	"xdg-desktop-portal-wlr: xdg-desktop-portal backend"
)
backup=(etc/sway/config)
arch=("i686" "x86_64")
url="https://github.com/WillPower3309/swayfx"
source=("${pkgname}::git+${url}.git"
    "i3-style-fullscreen.patch::https://gist.githubusercontent.com/bim9262/0f63e6b5d8107d7d2654b61e0b7debe2/raw"
    "keep-hidden-cursor-active.patch::https://github.com/lelgenio/sway/commit/b21dc487ac4bfc086cf295e06b8d8765a99e7266.patch"
	"sway-contrib::git+https://github.com/OctopusET/sway-contrib.git"
	50-systemd-user.conf
	sway-portals.conf)
sha512sums=(
	"SKIP"
	'8319fb528f8612d1e501e08cee0fc992a2f3aa81635ae2bce7d238619456c50d4d877cc7aa77fb927f612a0b5d41fd59565b53e1a0564df9922bdcca113824db'
	"f6068630b09d8dde28244cdaffb94038894b42d0f936ce1fe51aa85003e6a6724bee0d96ad842ff1649d3e4f37eeca68fcd9b415f137df98cb72a7fa18cbe790"
	"SKIP"
	"d5f9aadbb4bbef067c31d4c8c14dad220eb6f3e559e9157e20e1e3d47faf2f77b9a15e52519c3ffc53dc8a5202cb28757b81a4b3b0cc5dd50a4ddc49e03fe06e"
	"790741df028822bf4d83170dea57e1c63f7d7938cf31969e4cd347b0fc07330322b603c9ec0091b7a3f425132bed9dee6f261074cc273555120858beaaaf5da1")
provides=("sway" "swayfx" "wayland-compositor")
conflicts=("sway" "swayfx" "swayfx-git" "swayfx-i3-style-fullscreen-git")
options=(debug)
install=sway.install

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    patch --forward --strip=1 --input="${srcdir}/i3-style-fullscreen.patch"
    patch --forward --strip=1 --input="${srcdir}/keep-hidden-cursor-active.patch"
}

build() {
	export PKG_CONFIG_PATH='/usr/lib/wlroots0.17/pkgconfig'
	arch-meson \
		-Dwerror=false \
		-Dsd-bus-provider=libsystemd \
		"$pkgname" build
	meson compile -C build
}

package() {
	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
	install -Dm644 sway-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/sway-portals.conf"

	DESTDIR="$pkgdir" meson install -C build

	cd "$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	for util in autoname-workspaces.py inactive-windows-transparency.py grimshot/grimshot; do
		install -Dm755 "$srcdir/sway-contrib/$util" -t "$pkgdir/usr/share/$pkgname/scripts"
	done
}
