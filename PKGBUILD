# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-shell
pkgver=0.5.0
pkgrel=1
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
conflicts=("${pkgname}-git")
depends=('gtk-layer-shell>=0.1' 'wayfire>=0.5' pulseaudio gtkmm3)
makedepends=(wayland wayland-protocols meson ninja git gobject-introspection)
source=("https://github.com/WayfireWM/wf-shell/releases/download/${pkgver}/wf-shell-${pkgver}.tar.xz")
sha256sums=(fa481e867784b94b08857ec7bd27bf43251490d5d50c1e834e7ea64d908792f0)

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
