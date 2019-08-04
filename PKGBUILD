# Maintainer: Solomon Choina <shlomochoina@gmail@gmail.com>

# custom variables
_hkgname=scotty

# PKGBUILD options/directives
pkgname=haskell-scotty
pkgver=0.11.4
pkgrel=1
license=(BSD3)
pkgdesc="Haskell web framework inspired by Ruby's Sinatra, using WAI and Warp"
url="http://hackage.haskell.org/package/${_hkgname}"
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=("ghc-libs"
         "haskell-blaze-builder"
         "haskell-transformers-base"
         "haskell-wai"
         "haskell-wai-extra"
         "haskell-transformers-compat"
         "haskell-monad-control"
         "haskell-aeson"
         "haskell-network"
         "haskell-http-types"
         "haskell-case-insensitive"
         "haskell-warp"
         "haskell-regex-compat"
         "haskell-data-default-class"
         )
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "0001-Wrap-3.3-delete-fail-and-nats.patch"
  )

sha256sums=('f1b89ca31e7bb987746ec29a3de573950d9cd67e7e2dee63f141291b5ffde08f'
            '2c4addfcf3e0c63585d799628a673ac6df00f205038762c1bff22719dfe3f3e1')

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    patch -Np1 -i ../0001-Wrap-3.3-delete-fail-and-nats.patch
}

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    install -Dm 744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -Dm 744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
