# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
pkgname=hadolint
pkgver=2.13.1
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
sha256sums=('5df6d6b7c20c28588488665206259d3c9bb326d06401d5b8ce37fcfefb1a2e0e'
            '146501f7d4820023fe832e3191fee38df41d6e0ce668b5fe6305106488dfa960')

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
