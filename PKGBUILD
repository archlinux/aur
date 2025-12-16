# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-shell
pkgver=0.10.0
pkgrel=3
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64 aarch6)
license=(MIT)
depends=('gtk-layer-shell>=0.5' "wayfire>=${pkgver}" libpulse gtkmm3 alsa-lib libdbusmenu-gtk3)
makedepends=(wayland wayland-protocols meson ninja gobject-introspection glm glib2-devel)
source=("https://github.com/WayfireWM/wf-shell/releases/download/v${pkgver}/wf-shell-${pkgver}.tar.xz")
sha256sums=('49a7fc861849051a3be5de353e3d7442a37170c990a3ffd8d83b67a369edca93')
b2sums=('47297fc78906cfad9a07394cda67cabb3f9c773bd2544dd5d9deb991e4d8cc4e939aec1796ea2851dabf8111818cb61b954b39fd2116494904dc082586b99096')

build () {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build \
		--auto-features=disabled \
		-Dpulse=enabled \
		-Dwayland-logout=true
	meson compile -C build
}

check () {
	meson test -C build
}

package () {
	meson install -C build --destdir "$pkgdir"
	cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 wf-shell.ini.example "${pkgdir}/usr/share/doc/${pkgname}/wf-shell.ini.example"
}
