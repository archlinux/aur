# Maintainer: kamnxt <kamnxt@kamnxt.com>
# Contributor: RedTide <redtid3@gmail.com>

_pkgname="pugl"
pkgname="${_pkgname}-git"
pkgver=r1100.9b5a087
pkgrel=1
pkgdesc="Minimal portable API for GUIs which is suitable for use in plugins."
url="http://drobilla.net/software/pugl"
arch=('x86_64')
license=('custom:ISC')
depends=('libx11' 'libxcb' 'libxcursor' 'libxext' 'cairo')
makedepends=('meson' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}"::"git+https://github.com/lv2/pugl")
sha512sums=('SKIP')
pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}"
    meson setup "${pkgname}" build
    meson configure build -Ddocs=disabled
    meson compile -C build
}

package() {
    cd "${srcdir}/build"
    meson install --destdir="${pkgdir}"
    install -Dm644 "${srcdir}/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
