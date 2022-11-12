# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=hadolint
pkgver=2.12.0
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash, written in Haskell'
url='https://github.com/hadolint/hadolint/'
arch=('x86_64')
license=('GPL')
depends=('gmp')
makedepends=('stack')
conflicts=('hadolint-bin' 'hadolint-git')
source=(
    "https://github.com/hadolint/hadolint/archive/refs/tags/v${pkgver}.tar.gz"
    "stack.yaml"
)
sha256sums=('1f972f070fa068a8a18b62016c9cbd00df994006e069647038694fc6cde45545'
            'b48e1b7264197c61e79cbd0225cc2ddb924afd62f6444745e33da834e9e7ff5d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # NOTE: the official build of hadolint switched from stack to cabal.
    # However, it requires ghc>=9.2.x, while the version of ghc
    # currently available on Arch is 9.0.2.
    # For this reason, the package keeps using stack for now.
    cp "${srcdir}/stack.yaml" .

    stack build hadolint --flag hadolint:-static
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 \
        .stack-work/install/*/*/*/bin/hadolint \
        "${pkgdir}/usr/bin/hadolint"
}

