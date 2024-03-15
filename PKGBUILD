# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-shell-git
pkgver=r180.a7b1f20
pkgrel=1
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
depends=(wf-config gtkmm3 gtk-layer-shell pulseaudio)
makedepends=(wayland wayland-protocols meson ninja git gobject-introspection)
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
}
