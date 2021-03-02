# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_hkgname=language-docker
pkgname=haskell-"$_hkgname"
pkgver=9.1.3
pkgrel=1
pkgdesc="Dockerfile parser, pretty-printer and embedded DSL"
url="https://hackage.haskell.org/package/language-docker"
license=("GPL3")
arch=('x86_64')
depends=(
    'ghc-libs'
    'haskell-hunit'
    'haskell-quickcheck'
    'haskell-data-default-class'
    'haskell-hspec'
    'haskell-megaparsec'
    'haskell-prettyprinter'
    'haskell-split'
)
makedepends=('happy' 'alex' 'ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('07444ce6c0e1b0b934f004e361e02238085065b1ca346a6a413cb543155be632d7b385b4779ab063a3bf1e65ed47b456d2d954fa05cd683ef9bc284d6aaa325f')

build() {
    cd $_hkgname-$pkgver

    rm -fr dist

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
            -fseparatesyb -fusebytestrings -f-allwarnings -fiecfpextension
    runhaskell Setup build "$MAKEFLAGS"
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
