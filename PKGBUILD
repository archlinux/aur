# Maintainer: Sander van Kasteel <info at sandervankasteel dot nl>

pkgname=hyprland-git
pkgver=r274.2118628
pkgrel=1
pkgdesc="Hyprland is a Dynamic Tiling Wayland Compositor in early development stages"
arch=(any)
url="https://github.com/vaxerski/Hyprland"
license=('BSD')
depends=(libxcb xcb-proto xcb-util xcb-util-keysyms libinput libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols wlroots-git )
makedepends=(git cmake ninja gcc)
source=("${pkgname%-git}::git+https://github.com/vaxerski/Hyprland.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	make config
	cmake \
		-B build \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=Release
	ninja -C build
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
