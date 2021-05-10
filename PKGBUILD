# Maintainer: Zom <zomaur at eevul dot org>
pkgname=cardboard-git
_pkgname=cardboard
pkgver=r305.b54758d
pkgrel=2
license=("GPL3")
pkgdesc="A unique, scrollable tiling Wayland compositor designed with laptops in mind."
makedepends=(git meson ninja wayland-protocols pandoc)
depends=(libdrm libegl libinput libxkbcommon wayland xcb-util-wm xorg-server-xwayland)
optdepends=(
	"dmenu: Application launcher"
	"grim: Screenshot utility"
	"mako: Lightweight notification daemon"
	"slurp: Select a region"
	"swaybg: Set background"
	"swayidle: Idle management daemon"
	"swaylock: Screen locker"
	"waybar: Highly customizable bar"
)
arch=("i686" "x86_64")
url="https://gitlab.com/cardboardwm/cardboard"
source=("git+https://gitlab.com/cardboardwm/cardboard.git"
cardboardrc)
sha512sums=('SKIP'
'4727bc1419c2e63ec139cb05fa906e6d3da0f18aecf6922f48673c287255cbc9b6cc23575acd32032684b266cf66f46f134899af7ee812edf2eedf391bc3509c')
provides=("cardboard")
conflicts=("cardboard")
install=cardboard.install

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$_pkgname"
	meson --prefix /usr build --buildtype=release -Dman=true
	ninja -C build
}

package() {
	install -Dm755 cardboardrc -t "$pkgdir/usr/share/$pkgname/"
	cd "$_pkgname"
	DESTDIR="$pkgdir" meson install -C build
	rm -r "$pkgdir/usr/include/wlr" "$pkgdir/usr/lib/pkgconfig"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
