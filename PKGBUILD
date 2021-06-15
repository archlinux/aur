# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
# Prev Maintainer: Em Zhan <zqianem at gmail dot com>
# Contributor: Emanuel Couto <unit73e at gmail dot com>

_hkgname=pandoc-include-code
pkgname=pandoc-include-code
pkgver=1.5.0.0
pkgrel=4
pkgdesc="A pandoc filter for including code from source files"
url="https://github.com/owickstrom/pandoc-include-code"
license=('MPL2')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-pandoc-types' 'haskell-text' 'haskell-unordered-containers')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        pandoc-include-code.cabal.patch)
sha512sums=('1d2cc5fceb3183fe94e8a1ec3a641918f6531c961a1477f36686ee70b621325ff94e3006d17921ed55a1d53087d0ae614710c5a23913bc9a4419865061991018'
            SKIP)

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    patch -p0 < ../pandoc-include-code.cabal.patch
}

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
}
