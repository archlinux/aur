# Maintainer: Zom <zomaur at eevul dot org>
pkgname=cardboard-git
_pkgname=cardboard
pkgver=r300.f2ef2ff
pkgrel=2
license=("GPL3")
pkgdesc="A unique, scrollable tiling Wayland compositor designed with laptops in mind."
makedepends=(git meson ninja wayland-protocols)
depends=(libdrm libinput wayland xcb-util-wm xorg-server-xwayland)
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
'682d0ce694a89fd874c6e3c5d18dc863797de7ab99551b8bd1b87e238a41752a67b796649448bd1094375db0d993e33f0cba054741c43e037a7b239b3278ad5a')
provides=("cardboard")
conflicts=("cardboard")
install=cardboard.install

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$_pkgname"
	meson --prefix /usr build
	ninja -C build
}

package() {
	install -Dm755 cardboardrc -t "$pkgdir/usr/share/$pkgname/"
	cd "$_pkgname"
	DESTDIR="$pkgdir" meson install -C build
	rm -r "$pkgdir/usr/include/wlr" "$pkgdir/usr/lib/pkgconfig"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
