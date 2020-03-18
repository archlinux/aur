# Maintainer: Davide Depau <davide@depau.eu>

pkgname=xdg-desktop-portal-wlr-git
pkgver=r22.bba347b
pkgrel=1
pkgdesc='xdg-desktop-portal backend for wlroots'
url=https://github.com/emersion/xdg-desktop-portal-wlr
arch=(x86_64)
license=(custom:MIT)
provides=("${pkgname%-git}" "xdg-desktop-portal-impl")
conflicts=("${pkgname%-git}")
depends=(wlroots pipewire)
makedepends=(wayland-protocols meson ninja git wayland systemd-libs)
source=("${pkgname}::git+https://github.com/emersion/xdg-desktop-portal-wlr.git")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	rm -rf build
	arch-meson "${pkgname}" build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}

