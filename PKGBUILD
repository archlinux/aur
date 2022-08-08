# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
_hkgname=curl-aeson
pkgname=haskell-curl-aeson
pkgver=0.1.0.1
pkgrel=1
pkgdesc="Haskell library for communicating with HTTP service using JSON"
url="https://github.com/zouppen/haskell-curl-aeson"
license=('BSD')
arch=('x86_64')
depends=('haskell-curl' 'haskell-aeson')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('cae2746b92bd846256d1f20fdb3d4e87f73d65c0c2c35106d3f4b7d16777fe26bd7e13987358e08d417af745c93b84bdcc318456a6f1b147a8481086ea28e5a8')

build() {
    cd $_hkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid --ghc-option=-fllvm
    runhaskell Setup build $MAKEFLAGS
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd $_hkgname-$pkgver

    install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
    install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
    runhaskell Setup copy --destdir="$pkgdir"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}

