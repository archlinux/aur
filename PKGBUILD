# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire
pkgver=0.8.0
pkgrel=5
pkgdesc="3D wayland compositor"
arch=(x86_64 aarch64)
url=https://wayfire.org
license=(custom:MIT)
depends=(cairo pango "wf-config>=${pkgver%.*}" libjpeg libinput 'wlroots0.16')
makedepends=(meson ninja wayland-protocols glm cmake doctest nlohmann-json)
conflicts=("${pkgname}-git")
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        meson-ignore-git-return-values.patch
		fix-output-mirroring.patch)
b2sums=('4d80a0d43061a4564d45f7c077fd97737b426c4036c12f004815dbad120f51b38b2fac9a010e2df27a6a96205cd0dcceb81864bdccbd6e337d81f6c37926e019'
        '133844b43d93da3f7238204575d2ac0ef354d0728ff1e09c885ee84af59e6d3d3aad747b4cc721b6e0a63ebf73dd7fe133101a47bd4b2d92f00602320268a84f'
        '781697f867d92deabe816d6c11ccaedf4ab791ce79141b011bbdc765875b874c4787b07ebde1a60727ce5fbaa0b124e0c537154e745dcfde6092d6e2abe8f729')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -p1 -i "${srcdir}/meson-ignore-git-return-values.patch"
	patch -p1 -i "${srcdir}/fix-output-mirroring.patch"
}

build() {
	rm -rf build
	PKG_CONFIG_PATH=/usr/lib/wlroots0.16/pkgconfig \
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
