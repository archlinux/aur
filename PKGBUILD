# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-shell
pkgver=0.7.0
pkgrel=3
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
conflicts=("${pkgname}-git")
depends=('gtk-layer-shell>=0.5' 'wayfire>=0.7' libpulse gtkmm3 alsa-lib)
makedepends=(wayland wayland-protocols meson ninja gobject-introspection glm)
source=("https://github.com/WayfireWM/wf-shell/releases/download/v${pkgver}/wf-shell-${pkgver}.tar.xz")
sha256sums=(7495c690a1c021e0c82ba304513b3e7870cb329f7f0bf88df3bc5f46535d5ec7)

build () {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build -Dpulse=enabled
	ninja -C build
}

check () {
	meson test -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
	cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 wf-shell.ini.example "${pkgdir}/usr/share/doc/${pkgname}/wf-shell.ini.example"
}
