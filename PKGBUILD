# Maintainer: Adam Schadler (ajschadler at gmail dot com)
# Previous Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_threads=$(nproc)
pkgname=cmdstan
pkgver=2.35.0
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
b2sums=('8de5bfa4b6411a486ddc97e2479b6addc9e14a7ffdcc7a35a8733f517740fee4d19408d63b286363a5487ff89e76c016bf1e669d579b4fc2cb3e65f4a37ffd65')

prepare() {
    cd "${pkgname}-${pkgver}"
    # delete precompiled binaries in the tarball
    rm -r bin
}

build() {
    cd "${pkgname}-${pkgver}"
    make -j$_threads build
}

check() {
    cd "${pkgname}-${pkgver}"
    #python runCmdStanTests.py -j$_threads src/test
    ./test-all.sh $_threads
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
