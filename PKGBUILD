# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-shell-git
pkgver=r293.4db7389
pkgrel=1
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64)
license=(MIT)
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
depends=(wf-config-git gtkmm-4.0 gtk4-layer-shell libdbusmenu-glib libpulse)
makedepends=(wayland wayfire-git wayland-protocols meson ninja git gobject-introspection glib2-devel vala)
source=("${pkgname}::git+https://github.com/WayfireWM/wf-shell")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	rm -rf build
	arch-meson "${pkgname}" build -Dpulse=enabled
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 wf-shell.ini.example "${pkgdir}/usr/share/doc/${pkgname}/wf-shell.ini.example"

    # what the hell is wrong with this package?
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/lib/girepository-1.0"
	rm -f "${pkgdir}/usr/lib/libgtk4-layer-shell.so"
	rm -f "${pkgdir}/usr/lib/libgtk4-layer-shell.so.0"
	rm -f "${pkgdir}/usr/lib/libgtk4-layer-shell.so.1.1.1"
	rm -f "${pkgdir}/usr/lib/liblayer-shell-preload.so"
	rm -f "${pkgdir}/usr/lib/pkgconfig/gtk4-layer-shell-0.pc"
	rm -rf "${pkgdir}/usr/share/gir-1.0"
	rm -rf "${pkgdir}/usr/share/vala"
}
