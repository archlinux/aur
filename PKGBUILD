# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=cmdstan
pkgver=2.34.0
pkgrel=1
pkgdesc="The command line interface to Stan, a C++ library for statistical modeling and high-performance statistical computation"
arch=('x86_64')
url="https://mc-stan.org/"
license=('BSD-3-Clause')
depends=(
    'gcc-libs'
    'glibc'
)
makedepends=('gcc')
checkdepends=('python')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/stan-dev/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
    "https://patch-diff.githubusercontent.com/raw/stan-dev/cmdstan/pull/1239.patch"
)
b2sums=('d1b8e410e48d15ca9227e232da4b8fecc564cc40a1a91e13bc76f5aa403aa7a9d88ad89286b2a95c8a79653c9cb8b9b9387c75efc6913c76fdce27f5c4ee7ac5'
        '01c4a242db1749816f57c81855313bc8b80a6cd1721a8d9199d418831f6e3de6e14a5c795297641fa9af909da6c68dd9e660c0f7b8d565503a90896b8316acd4')

prepare() {
    # https://github.com/stan-dev/cmdstan/issues/1238
    patch --directory="${pkgname}-${pkgver}" --forward --strip=1 --input="${srcdir}/1239.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    make -j$(nproc) build
}

check() {
    cd "${pkgname}-${pkgver}"
    make -j$(nproc) examples/bernoulli/bernoulli
    ./examples/bernoulli/bernoulli sample data file=examples/bernoulli/bernoulli.data.json
    ./bin/stansummary output.csv
    python runCmdStanTests.py src/test
}

package() {
    cd "${pkgname}-${pkgver}"
    install -D -t "${pkgdir}/usr/bin" bin/{stanc,stansummary}
    install bin/diagnose "${pkgdir}/usr/bin/stan-diagnose"
    install bin/print "${pkgdir}/usr/bin/stan-print"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
