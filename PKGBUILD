# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire
pkgver=0.9.0
pkgrel=1
pkgdesc="3D wayland compositor"
arch=(x86_64 aarch64)
url=https://wayfire.org
license=(MIT)
depends=(cairo pango "wf-config>=${pkgver%.*}.0" libjpeg libinput wlroots0.17)
makedepends=(meson ninja wayland-protocols glm cmake doctest nlohmann-json)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('dd0c9c08b8a72a2d8c3317c8be6c42b17a493c25abab1d02ac09c24eaa95229d')
b2sums=('d7f07d7ff8a54437dc5b69e27dcfadecbd3426993e88f68f4af376bbbde08c8ea76646a361d4228ae8ee21e03c3ebe5562b80ec9d3aecde03fb653135fec8645')

build() {
	rm -rf build
	PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig \
	arch-meson "${pkgname}-${pkgver}" build \
		--auto-features=disabled \
		-Duse_system_wfconfig=enabled \
		-Duse_system_wlroots=enabled \
		-Dxwayland=enabled \
		-Dtests=enabled
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
