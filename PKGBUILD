pkgname=super-user-spark
pkgver=0.3.2.0
pkgrel=3
pkgdesc="Configure your dotfile deployment with a DSL"
url="https://github.com/NorfairKing/super-user-spark"
license=('MIT')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-aeson' 'haskell-aeson-pretty' 'haskell-mtl' 'haskell-optparse-applicative' 'haskell-parsec' 'haskell-puremd5' 'haskell-shelly' 'haskell-text')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('af92140fdf84fc53f13a1def9b8fc38d682560d4cec6391d53850982678515433efc8dcb46233a8aa995261550de174bd161bb9ba1e92fb572572c153dcade44')

prepare() {
    sed -e 's/aeson *>= 0.8 *&& < 1.1/aeson >= 0.8 \&\& < 1.3/' \
        -e 's/directory *>= 1.2.5 *&& < 1.3/directory >= 1.2.5 \&\& < 1.4/' \
        -e 's/optparse-applicative *>= 0.11 *&& < 0.14/optparse-applicative >= 0.11 \&\& < 0.15/' \
        -e 's/process *>= 1.2 *&& < 1.5/process >= 1.2 \&\& < 1.7/' \
        -e 's/shelly *>= 1.6 *&& < 1.7/shelly >= 1.6 \&\& < 1.8/' \
        -i $pkgname-$pkgver/$pkgname.cabal
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

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
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
