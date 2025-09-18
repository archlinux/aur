# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wcm-git
pkgver=0.9.0.r11.g8bf4c48
pkgrel=1
pkgdesc='Wayfire Config Manager'
url=https://wayfire.org
arch=(x86_64)
license=(MIT)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(fmt gtkmm3 wayfire-git wf-shell-git)
makedepends=(wayland-protocols meson ninja git extra-cmake-modules)
optdepends=("wayfire-plugins-extra: configuration for extra Wayfire plugins"
            "wdisplays: configuration for display modes")
source=("${pkgname}::git+https://github.com/WayfireWM/wcm")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'|sort -V|tail -n1
  )
}

prepare() {
  rm -rf build
  arch-meson "${pkgname}" build
}

build () {
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 "${pkgname}/"LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
