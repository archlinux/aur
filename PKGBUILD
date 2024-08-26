# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire-plugins-extra
pkgver=0.9.0
pkgrel=1
pkgdesc='Additional plugins for Wayfire'
url=https://wayfire.org
arch=(x86_64)
license=(MIT)
conflicts=(wayfire-plugins-focus-request
           wayfire-plugins-windecor
           wayfire-plugins-shadows-git)
depends=("wayfire>=${pkgver%.*}" cairo glibmm iio-sensor-proxy librsvg)
makedepends=(meson ninja nlohmann-json glm git wayland-protocols)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('fa3768bde8a1203ca7becebf3554adf73e81c478516807f2e115ad0aaf903239')
b2sums=('8dde47dd40edabb8243c6a4128229baa4d2ff3407eb9cf0ff1699ca49dfaaf16f951f4faf18138824894f94b0ca6884bbc92fab595d4e08b948b67a0a0cf054f')

build () {
	rm -rf build
	PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig \
	arch-meson "${pkgname}-${pkgver}" build \
		-Denable_filters=true \
		-Denable_focus_request=true \
		-Denable_pixdecor=true \
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
