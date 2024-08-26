# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-shell
pkgver=0.9.0
pkgrel=1
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64 aarch6)
license=(MIT)
depends=('gtk-layer-shell>=0.5' "wayfire>=${pkgver}" libpulse gtkmm3 alsa-lib libdbusmenu-gtk3)
makedepends=(wayland wayland-protocols meson ninja gobject-introspection glm glib2-devel)
source=("https://github.com/WayfireWM/wf-shell/releases/download/v${pkgver}/wf-shell-${pkgver}.tar.xz")
sha256sums=('c8ac529b9fa6a4f65bd430140394b6b6a486c7b2def6c22b811396612ba94bb4')
b2sums=('ea68e110381fa76590f193e6d9035e2ce1ce1a998a4c476785912d5666f42f9976b89ef78511b6d17e36f3dfb7022ed460b8b29a379445c5d41392ec7bb3ad3f')

build () {
	rm -rf build
	PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig \
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
