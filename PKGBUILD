# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=cmdstan
pkgver=2.34.0
pkgrel=3
pkgdesc="The command line interface to Stan, a C++ library for statistical modeling and high-performance statistical computation"
arch=('x86_64')
url="https://mc-stan.org/"
license=('BSD-3-Clause')
depends=(
    'gcc-libs'
    'glibc'
)
makedepends=('gcc')
checkdepends=(
    'gtest'
    'python'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/stan-dev/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
    "fix-test.patch::https://patch-diff.githubusercontent.com/raw/stan-dev/cmdstan/pull/1239.patch"
    "fix-gcc13.patch::https://patch-diff.githubusercontent.com/raw/stan-dev/stan/pull/3255.patch"
)
b2sums=('d1b8e410e48d15ca9227e232da4b8fecc564cc40a1a91e13bc76f5aa403aa7a9d88ad89286b2a95c8a79653c9cb8b9b9387c75efc6913c76fdce27f5c4ee7ac5'
        '01c4a242db1749816f57c81855313bc8b80a6cd1721a8d9199d418831f6e3de6e14a5c795297641fa9af909da6c68dd9e660c0f7b8d565503a90896b8316acd4'
        '2f85d727a1ce730876cd16ae6badd7f9bc90dc3bdf40e9761bd767d047f85f4e8f98c260bc0c77310ba5b202b4dc1e00e9927fdeb92bb5dc860379f341ef35e6')

prepare() {
    cd "${pkgname}-${pkgver}"
    # delete precompiled binaries in the tarball
    rm -r bin
    # https://github.com/stan-dev/cmdstan/issues/1238
    patch --forward --strip=1 --input="${srcdir}/fix-test.patch"
    # fix build tests with gcc13
    patch --directory=stan --forward --strip=1 --input="${srcdir}/fix-gcc13.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    make -j$(nproc) build
}

check() {
    cd "${pkgname}-${pkgver}"
    python runCmdStanTests.py -j$(nproc) src/test

    #cd stan
    #python runTests.py -j$(nproc) src/test

    #cd lib/stan_math
    #python runTests.py -j$(nproc) test/unit
    #python runTests.py -j$(nproc) test/prob
}

package() {
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -r "${pkgname}-${pkgver}" "${pkgdir}/opt/cmdstan"
    ln -s "/opt/cmdstan/bin/stanc" "${pkgdir}/usr/bin/stanc"
    ln -s "/opt/cmdstan/bin/stansummary" "${pkgdir}/usr/bin/stansummary"
    ln -s "/opt/cmdstan/bin/diagnose" "${pkgdir}/usr/bin/stan-diagnose"
    ln -s "/opt/cmdstan/bin/print" "${pkgdir}/usr/bin/stan-print"
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
