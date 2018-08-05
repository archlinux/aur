# Maintainer: physkets <physkets // at // tutanota dot com>

_pkgname=ogpf
pkgname="${_pkgname}-git"
pkgver="r49.578f7b6"
pkgrel=1
pkgdesc="An object-oriented Fortran module to access GnuPlot"
arch=('x86_64')
url="https://kookma.github.com/ogpf"
license=('MIT')
depends=('libgfortran.so' 'gnuplot')
makedepends=('gcc-fortran')
source=('git+https://github.com/kookma/ogpf')
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    gfortran -O3 -shared -fPIC -o libogpf.so ogpf.f90
}

_gcc_ver="$(gcc --version | awk 'NR==1 {print$3}')"

package() {
    install -Dm755 -t "${pkgdir}/usr/lib" "${srcdir}/${_pkgname}/libogpf.so"
    install -Dm644 -t "${pkgdir}/usr/lib/gcc/x86_64-pc-linux-gnu/${_gcc_ver}/finclude" "${srcdir}/${_pkgname}/ogpf.mod"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/ogpf/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/ogpf/README.md"
    install -Dm644 -t "${pkgdir}/usr/share/doc/ogpf/doc" "${srcdir}/${_pkgname}/doc/"*
}
