# Maintainer: Max <ulidtko@gmail.com>

_hkgname=filepath
pkgname=haskell-filepath
pkgver=1.5.5.0
pkgrel=1
pkgdesc="Library for manipulating FilePaths in a cross platform way. (backport)"
url="https://github.com/haskell/filepath"
license=("BSD-3-Clause")
arch=('x86_64')
depends=(haskell-base haskell-bytestring haskell-deepseq haskell-exceptions haskell-os-string haskell-template-haskell)
makedepends=('ghc'
             'haskell-generic-random' 'haskell-generic-deriving'
             'haskell-tasty' 'haskell-tasty-quickcheck' 'haskell-quickcheck-classes-base')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('87e6f50f43ffce293fd431184d321ff11a480d28369dde306aaae450ba4a7d1e')

#-- Packager NOTE: this is a backport.
#--
#-- The `filepath` library is part of the "Haskell Platform", which means it's shipped with GHC.
#-- However, the current 'ghc-libs' in [extra], 9.6.6, provides haskell-filepath=1.4.300.1 (from 2024)
#-- and there have been large additions to the library, now required by other dependees.

build() {
  cd $_hkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    -f-cpphs

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
