# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
pkgname=hadolint
pkgver=2.15.1
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash, written in Haskell'
url='https://github.com/hadolint/hadolint/'
arch=('x86_64')
license=('GPL-3.0-only')
depends=('gmp')
makedepends=('stack')
conflicts=('hadolint-bin' 'hadolint-git')
source=(
    "https://github.com/hadolint/hadolint/archive/refs/tags/v${pkgver}.tar.gz"
    "stack.yaml"
)
sha256sums=('52fbc1c8a4558f89e3b0c9d905e62016cf58ae842f9fa3ac93c56bb45f8c9ddb'
            '93327c6842c4b48db8ca26354cf2d9aceb1fc0b63e8c46458bf7f4d4d8b6601c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # NOTE: the official build of hadolint switched from stack to cabal.
    # However, it requires ghc>=9.10.x, while the version of ghc
    # currently available on Arch is 9.4.8.
    # For this reason, the package keeps using stack for now.
    cp "${srcdir}/stack.yaml" .

    stack build hadolint
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 \
        .stack-work/install/*/*/*/bin/hadolint \
        "${pkgdir}/usr/bin/hadolint"
}
