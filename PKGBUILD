# Maintainer: RedTide <redtid3@gmail.com>

_pkgname="pugl"
pkgname="${_pkgname}-git"
pkgver=r673.d70aa80
pkgrel=1
pkgdesc="Minimal portable API for GUIs which is suitable for use in plugins."
url="http://drobilla.net/software/pugl"
arch=('x86_64')
license=('custom:ISC')
depends=('libx11' 'libxcb' 'libxcursor' 'libxext' 'cairo')
makedepends=('git' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}"::"git+https://github.com/lv2/pugl"
        'autowaf::git+https://gitlab.com/drobilla/autowaf.git')
sha512sums=('SKIP' 'SKIP')
pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.waflib.url "${srcdir}/autowaf"
    git submodule update
}
build() {
    cd "${srcdir}/${pkgname}"
    python waf configure --prefix=/usr
}
package() {
    cd "${srcdir}/${pkgname}"
    python waf install --destdir="${pkgdir}"
    install -Dm644 "${srcdir}/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
