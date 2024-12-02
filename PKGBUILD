# Maintainer: Fabian Posch <aur@posch.tech>

_pkgname=annotate
pkgname=act-${_pkgname}-git
_basever=0
_patchlvl=1
_gitversion=r40.500495e
pkgver=${_basever}.${_patchlvl}.${_gitversion}
pkgrel=1
pkgdesc="This package contains SPEF and SDF readers used to back-annotate an ACT design."
arch=('x86_64')
url="https://github.com/asyncvlsi/annotate"
license=('LGPL-2.1')
depends=('act-core')
makedepends=('git' 'make' 'gcc')
conflicts=("act-${_pkgname}")
provides=("act-${_pkgname}")
source=(
    "git+${url}"
)
sha512sums=(
    "SKIP"
)

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -Dm644 ${srcdir}/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    export ACT_HOME="/opt/act-async"
    mkdir -p ${pkgdir}/opt/act-async/bin
    mkdir -p ${pkgdir}/opt/act-async/conf/generic
    mkdir -p ${pkgdir}/opt/act-async/include/act
    mkdir -p ${pkgdir}/opt/act-async/lib

    export LIBRARY_PATH=${pkgdir}/opt/act-async/lib

    cd ${_pkgname}
    make install_inc INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"
    make depend INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"
    make INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"
    make install INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"

    rm -rf ${pkgdir}/opt/act-async/act
    rm -rf ${pkgdir}/opt/act-async/conf

}
