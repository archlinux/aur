# Maintainer: Fabian Posch <aur@posch.tech>

_pkgname=expropt
pkgname=act-${_pkgname}-git
_basever=0
_patchlvl=1
_gitversion=r66.b4f4b14
pkgver=${_basever}.${_patchlvl}.${_gitversion}
pkgrel=1
pkgdesc="The ExprOpt Library is used to optimize the sets of expressions by using external synthesis tools. "
arch=('x86_64')
url="https://github.com/asyncvlsi/expropt"
license=('GPL-2.0')
depends=('act-core' 'sed' 'abc' 'yosys')
makedepends=('git' 'make' 'gcc' 'binutils' 'patch')
conflicts=("act-${_pkgname}")
provides=("act-${_pkgname}")
source=(
    "git+${url}"
    "makefile.patch"
)
sha512sums=(
    "SKIP"
    "e819067e8ad69226770a5f991f1a926ce06d86853029a08d76deac39787e4ac9fa93bdee13f4321cf5151c73796b95441dc073a608093cc5558cb0daf3beaf38"
)

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    # we use abc installed through package instead of a local version
    patch "${srcdir}/${_pkgname}/Makefile" < "${srcdir}/makefile.patch"
}

package() {
    install -Dm644 ${srcdir}/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    export ACT_HOME="/opt/act-async"
    mkdir -p ${pkgdir}/opt/act-async/conf/generic
    mkdir -p ${pkgdir}/opt/act-async/include
    mkdir -p ${pkgdir}/opt/act-async/lib

    cd ${_pkgname}
    make depend INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"
    make INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"
    make install INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"

    rm -rf ${pkgdir}/opt/act-async/act

}