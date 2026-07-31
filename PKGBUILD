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
            'bb29be1cc8ee96874f5bf6ad816e985bb7bbc37990caa4f4b33c1585816d9187')

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
