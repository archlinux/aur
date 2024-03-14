# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-shell
pkgver=0.8.1
pkgrel=5
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64 aarch6)
license=(MIT)
conflicts=("${pkgname}-git")
depends=('gtk-layer-shell>=0.5' "wayfire>=${pkgver}" libpulse gtkmm3 alsa-lib libdbusmenu-gtk3)
makedepends=(wayland wayland-protocols meson ninja gobject-introspection glm)
source=("https://github.com/WayfireWM/wf-shell/releases/download/v${pkgver}/wf-shell-${pkgver}.tar.xz")
b2sums=('d778b2ed214dbb1b072400a85021d3ef4e590bc707417cf2de486c9211fdf3d1fa1c14d786363bc7dd4daeeb39406d6aa2e2c3c0b607cb9b6c87151d330a3983')

build () {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build \
		--auto-features=disabled \
		-Dpulse=enabled \
		-Dwayland-logout=true
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
