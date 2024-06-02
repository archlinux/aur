# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire-plugins-extra
pkgver=0.8.1
pkgrel=1
pkgdesc='Additional plugins for Wayfire'
url=https://wayfire.org
arch=(x86_64)
license=(MIT)
conflicts=(wayfire-plugins-focus-request
           wayfire-plugins-windecor
           wayfire-plugins-shadows-git)
depends=('wayfire>=0.8.1' cairo glibmm iio-sensor-proxy librsvg)
makedepends=(meson ninja glm git wayland-protocols)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
b2sums=('65c14281fd9738864f2d63f01250e6384cdf46929ee6df653a5614805b89686f0020799246d6caf16b8d45aa16a66f314e705ae96c37188d892d339875ed4c03')

build () {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build \
		-Denable_focus_request=true \
		-Denable_wayfire_shadows=true \
		-Denable_windecor=true \
		--auto-features=disabled
	ninja -C build
}

check () {
	meson test -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
	cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
