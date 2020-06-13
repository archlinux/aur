# Maintainer: kodemeister <kodemeister@outlook.com>

pkgname=ghcid
pkgver=0.8.7
pkgrel=1
pkgdesc="GHCi based bare bones IDE"
url="https://github.com/ndmitchell/ghcid"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-ansi-terminal' 'haskell-cmdargs' 'haskell-extra' 'haskell-fsnotify' 'haskell-terminal-size')
makedepends=('ghc' 'haskell-tasty' 'haskell-tasty-hunit')
source=("https://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('69748c115db36d4b41dafdbbfaeedc80be3a3bdadf15b16386e36138193fcc8c89d84b2990fb69175acedbb5cab62251387405ccbb2e7bcc8d04f5370effab8a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" --datasubdir="${pkgname}" --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
        --ghc-option='-pie'
    runhaskell Setup build $MAKEFLAGS
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    runhaskell Setup test
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
