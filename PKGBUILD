# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire-plugins-extra
pkgver=0.10.0
pkgrel=1
pkgdesc='Additional plugins for Wayfire'
url=https://wayfire.org
arch=(x86_64)
license=(MIT)
conflicts=(wayfire-plugins-focus-request
           wayfire-plugins-windecor
           wayfire-plugins-shadows-git)
depends=("wayfire>=${pkgver%.*}" cairo glibmm iio-sensor-proxy librsvg)
makedepends=(boost meson ninja nlohmann-json glm git vulkan-headers wayland-protocols)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('52704f13a6a59c106d6fb69e79aa8c57dadcea98f91e097df72478dd311a15e6')
b2sums=('18cf7da7dff2be95cdbd104789f8bed0675aed05295ebacefd24503bad5abba84e0ed0b873de97dbf7916dc8607ab7ad41f2ac03b3b2ed2708beaa7b7eb14905')

build () {
	rm -rf build
	PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig \
	arch-meson "${pkgname}-${pkgver}" build \
		-Denable_filters=true \
		-Denable_focus_request=true \
		-Denable_pixdecor=true \
		-Denable_wayfire_shadows=true \
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
