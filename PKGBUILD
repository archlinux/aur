# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire
pkgver=0.10.1
pkgrel=2
pkgdesc="3D wayland compositor"
arch=(x86_64 aarch64)
url=https://wayfire.org
license=(MIT)
depends=(cairo pango "wf-config>=${pkgver%.*}.0" libjpeg libinput wlroots0.19 yyjson)
makedepends=(meson ninja wayland-protocols glm cmake doctest nlohmann-json vulkan-headers)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz" meson-no-pch.patch)
sha256sums=('9257c94ae958240126fbf1e267e0b408c9afa273ed6e5febb3200e2ff3fcf1f8'
            '325c9bbe82f5f659284c7b1900164014723cd63432bbcf4caf94ce16092a9707')
b2sums=('857610f2e4df4f9b1e6a39d10f3d935b8948ac8811723ac376f48afd9376098574a1da8ab22b8507dcc896ca1bb6e32041242853bd0c371473f05022e6e25e14'
        '553070984f71678fa307c13a63a4d790e8956c34518d7cba031f5783d317d27fc73ad0f07de1a61f218ad2a388345ca0a41287018ef407fdbe3cc108eaeb4668')

prepare() {
	patch -p0 -i "$srcdir/meson-no-pch.patch"
}

build() {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build \
		--auto-features=disabled \
		-Duse_system_wfconfig=enabled \
		-Duse_system_wlroots=enabled \
		-Dxwayland=enabled \
		-Dtests=enabled \
		-Dcustom_pch=false
	meson compile -C build
}

check () {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	cd "${pkgname}-${pkgver}"
	install -Dm644 wayfire.desktop "${pkgdir}/usr/share/wayland-sessions/wayfire.desktop"
	install -Dm644 wayfire.ini "${pkgdir}/usr/share/doc/${pkgname}/wayfire.ini"
	install -Dm645 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
