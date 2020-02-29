# Maintainer: 71e6fd52 <71e6fd52 at gmail dot com>

_hkgname=butcher
pkgname=haskell-butcher
pkgver=1.3.2.3
pkgrel=1
pkgdesc='Chops a command or program invocation into digestable pieces.'
url='https://hackage.haskell.org/package/butcher'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs' 'haskell-bifunctors' 'haskell-containers' 'haskell-deque' 'haskell-extra' 'haskell-free' 'haskell-hspec' 'haskell-microlens' 'haskell-microlens-th' 'haskell-mtl' 'haskell-multistate' 'haskell-pretty' 'haskell-transformers' 'haskell-unsafe' 'haskell-void')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('55e2fc0ee8d35ddd90a7e6bbf65355423f7d71a3e1097f0a93706361f10796773b717d5e2e17c700fa7f7c7fa6fdef9aaa0f103af755fa06523b684f162018d4')

prepare() {
    cd $_hkgname-$pkgver

    sed -i 's/base .*$/base/' butcher.cabal
}

build() {
    cd $_hkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
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
