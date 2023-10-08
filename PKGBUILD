# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-shell
pkgver=0.8.0
pkgrel=1
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
conflicts=("${pkgname}-git")
depends=('gtk-layer-shell>=0.5' "wayfire>=${pkgver%.*}" libpulse gtkmm3 alsa-lib libdbusmenu-gtk3)
makedepends=(wayland wayland-protocols meson ninja gobject-introspection glm)
source=("https://github.com/WayfireWM/wf-shell/releases/download/v${pkgver}/wf-shell-${pkgver}.tar.xz")
b2sums=('0867f9968fca25d183fb912e01afc55ae6c9e3a0645eb63b2622ed53bb5d6538827a8e1bb6c68be4885f0c1513e76f0fd8f580402885bfa49dcbc7a0b8b02b49')

build () {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build \
		--auto-features=disabled \
		-Dpulse=enabled
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
