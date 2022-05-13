# Maintainer: ThatOneCalculator <kainoa@t1c.dev>, Sander van Kasteel <info@sandervankasteel.nl>

pkgname=hyprland-git
pkgver=r446.gbef4d7c
pkgrel=2
pkgdesc="Hyprland is a Dynamic Tiling Wayland Compositor"
arch=(any)
url="https://github.com/vaxerski/Hyprland"
license=('BSD')
depends=(libxcb xcb-proto xcb-util xcb-util-keysyms libinput libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols wlroots-git)
makedepends=(git cmake ninja gcc)
source=("${pkgname%-git}::git+https://github.com/vaxerski/Hyprland.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	make config
	make release
	cd hyprctl
	make all
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	install -Dm755 build/Hyprland -t "${pkgdir}/usr/bin"
	install -Dm755 hyprctl/hyprctl -t "${pkgdir}/usr/bin"
	install -Dm644 assets/*.png -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 example/hyprland.desktop -t "${pkgdir}/usr/share/wayland-sessions"
	install -Dm644 example/hyprland.conf -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
