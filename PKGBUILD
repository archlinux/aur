# Maintainer: 71e6fd52 <71e6fd52 at gmail dot com>

_hkgname=multistate
pkgname=haskell-multistate
pkgver=0.8.0.3
pkgrel=1
pkgdesc="like mtl's ReaderT / WriterT / StateT, but more than one contained value/type."
url='https://hackage.haskell.org/package/multistate'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs' 'haskell-hspec' 'haskell-monad-control' 'haskell-tagged' 'haskell-transformers-base')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('e4405dfae45f3d7ca04f93871d6c29750390a1058c293561b681b792c31e2b44cac9ff09f3baab8b470858375a30e586d47ba64b72d2861ad6407ac124ca2ce5')

build() {
    cd $_hkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
        --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
        --ghc-option='-pie'
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
    cd $_hkgname-$pkgver
    runhaskell Setup test
}

package() {
    cd $_hkgname-$pkgver

    install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
    install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
    runhaskell Setup copy --destdir="$pkgdir"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
