# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire
pkgver=0.8.0
pkgrel=1
pkgdesc="3D wayland compositor"
arch=(x86_64)
url=https://wayfire.org
license=(custom:MIT)
depends=(cairo pango "wf-config>=${pkgver%.*}" libjpeg libinput 'wlroots>=0.16' 'wlroots<0.17')
makedepends=(meson ninja wayland-protocols glm cmake doctest nlohmann-json)
conflicts=("${pkgname}-git")
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
b2sums=('4d80a0d43061a4564d45f7c077fd97737b426c4036c12f004815dbad120f51b38b2fac9a010e2df27a6a96205cd0dcceb81864bdccbd6e337d81f6c37926e019')

build() {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build \
		--auto-features=disabled \
		-Duse_system_wfconfig=enabled \
		-Duse_system_wlroots=enabled \
		-Dxwayland=enabled
	ninja -C build
}

check () {
	meson test -C build
}

package() {
	DESTDIR="${pkgdir}/" ninja -C build install
	cd "${pkgname}-${pkgver}"
	install -Dm644 wayfire.desktop "${pkgdir}/usr/share/wayland-sessions/wayfire.desktop"
	install -Dm644 wayfire.ini "${pkgdir}/usr/share/doc/${pkgname}/wayfire.ini"
	install -Dm645 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
