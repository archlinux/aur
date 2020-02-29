# Maintainer: 71e6fd52 <71e6fd52 at gmail dot com>

_hkgname=brittany
pkgname=haskell-brittany
pkgver=0.12.1.1
pkgrel=2
pkgdesc="Haskell source code formatter (dynamic link)"
url='https://hackage.haskell.org/package/brittany'
license=('AGPL3')
arch=('x86_64')
depends=('ghc-libs' 'haskell-aeson' 'haskell-butcher' 'haskell-cmdargs' 'haskell-czipwith' 'haskell-data-tree-print' 'haskell-extra' 'haskell-ghc-exactprint' 'haskell-ghc-paths' 'haskell-hspec' 'haskell-monad-memo' 'haskell-multistate' 'haskell-neat-interpolation' 'haskell-random' 'haskell-safe' 'haskell-semigroups' 'haskell-strict' 'haskell-syb' 'haskell-uniplate' 'haskell-unsafe' 'haskell-yaml')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('ac471ab778efd1a007e76594a54fe3bea8f96afc3f0714c7b0ec66273788a6c9d8e0d0b9d5e36c2a10d547d10a6ad2327ea540d836b9a12549a918b5c83a9425')

prepare() {
    cd $_hkgname-$pkgver

    sed -i -r 's/(neat-interpolation) .*$/\1/' $_hkgname.cabal
}

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
