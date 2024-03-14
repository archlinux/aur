# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire-plugins-extra
pkgver=0.8.0
pkgrel=2
pkgdesc='Additional plugins for Wayfire'
url=https://wayfire.org
arch=(x86_64)
license=(MIT)
conflicts=("${pkgname}-git"
           wayfire-plugins-focus-request
           wayfire-plugins-windecor
           wayfire-plugins-shadows-git)
depends=('wayfire>=0.8.1' cairo glibmm iio-sensor-proxy librsvg)
makedepends=(meson ninja glm git wayland-protocols)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        wlroots-0.17-changes.patch)
b2sums=('f8f46782e31f170eb566567f50d302df4db23fbeb29c71569624a7f79c2bbcfcf48b070e7b55bf1880a9cd02afe78783d6680c457e466d765eb0db72f4b1f61b'
        'a0d8815f27b695baf0f46de25654388783bdc886d9d43922a1fb4d6a92cfe261ecc9f04e2bccc458081ac242e21612b4fe5a8ad71cc1ac06180039650aa3d97a')

prepare () {
	cd "${pkgname}-${pkgver}"
	patch -p1 -i"${srcdir}/wlroots-0.17-changes.patch"
}

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
