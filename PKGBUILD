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
'351d5b3b96032586cf36f56f640146df8c873b641406bedf13d081e0c99fdd45dd4f9d2771c8d2cdac6cd1365e310285e8a07bdd7355a3788069c18b6b4ec106')
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
