# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire
pkgver=0.10.0
pkgrel=1
pkgdesc="3D wayland compositor"
arch=(x86_64 aarch64)
url=https://wayfire.org
license=(MIT)
depends=(cairo pango "wf-config>=${pkgver%.*}.0" libjpeg libinput wlroots0.19 yyjson)
makedepends=(meson ninja wayland-protocols glm cmake doctest nlohmann-json vulkan-headers)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('83f98d67479f41f3a4dcf30b414495bb8df2353daa7601159f4012a120827a16')
b2sums=('d65b32c74a46d6e9e8c5c484515a44d51c01f090764f31b3e82e63c3444b11acde632840e0d081b4386675de021194d2925e15842be6b9bfaa528ce8fa67f06b')

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
