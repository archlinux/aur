# Maintainer: Adam Schadler (ajschadler at gmail dot com)
# Previous Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=cmdstan
pkgver=2.38.0
pkgrel=1
pkgdesc="The command line interface to Stan, a C++ library for statistical modeling and high-performance statistical computation"
arch=('x86_64')
url="https://mc-stan.org/"
license=('BSD-3-Clause')
depends=(
    'gcc-libs'
    'glibc'
)
#makedepends=('gcc')
checkdepends=(
    'gtest'
    'python'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/stan-dev/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
b2sums=('ea2038131139a239b1a676497d480de5d1a5c7d13fe4a0a9b51ed3bf24ad2b240450751ab75bc4113be2682cf94c469662a8450654745e1b821627b5f1e13d9d')

prepare() {
    cd "${pkgname}-${pkgver}"
    # delete precompiled binaries in the tarball
    rm -r bin
}

build() {
    cd "${pkgname}-${pkgver}"
    make build
}

check() {
    cd "${pkgname}-${pkgver}"
    #python runCmdStanTests.py -jNPROC src/test
    ./test-all.sh $NPROC
}

package() {
    # Cleanup
    find "${srcdir}/${pkgname}-${pkgver}" -name '*.o' -delete

    # Install
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -a --no-preserve=ownership "${pkgname}-${pkgver}" "${pkgdir}/opt/cmdstan"
    ln -s "/opt/cmdstan/bin/stanc" "${pkgdir}/usr/bin/stanc"
    ln -s "/opt/cmdstan/bin/stansummary" "${pkgdir}/usr/bin/stansummary"
    ln -s "/opt/cmdstan/bin/diagnose" "${pkgdir}/usr/bin/stan-diagnose"
    ln -s "/opt/cmdstan/bin/print" "${pkgdir}/usr/bin/stan-print"
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
