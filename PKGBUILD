# Contributor: Timmy Weerwag <timmy@timmyweerwag.nl>
_hkgname=generic-arbitrary
pkgname=haskell-generic-arbitrary
pkgver=0.1.0
pkgrel=1
pkgdesc="Generic implementation for QuickCheck's Arbitrary"
license=('MIT')
arch=('x86_64')
url="https://hackage.haskell.org/package/$hkgname"
depends=(ghc-libs haskell-quickcheck)
makedepends=(ghc)
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
md5sums=('830b9eed0b6c1418babfb991023a06f4')

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
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
