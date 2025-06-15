# Maintainer: Max <ulidtko@gmail.com>

_hkgname=atomic-counter
pkgname=haskell-atomic-counter
pkgver=0.1.2.3
pkgrel=1
pkgdesc="Mutable counters that can be modified with atomic operatinos"
url="https://github.com/sergv/atomic-counter"
license=("Apache-2.0")
arch=('x86_64')
depends=('ghc-libs')
makedepends=('ghc' 'haskell-quickcheck' 'haskell-async' 'haskell-tasty' 'haskell-tasty-quickcheck')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz"
        Setup.hs
       )
sha256sums=('ce4b63391b3c0d426cbe32af89f483222602a5b43aa5379aa720bf6f45f4cf04'
            '5066653559d4d6134b022d66a634a17fdcf8db35d28b447e581fec284afa4689')

prepare() {
    #-- the package does not come with a Setup.hs, use the simplest default
    mv -v Setup.hs $_hkgname-$pkgver/
}

build() {
  cd $_hkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    -f-no-cmm

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
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
