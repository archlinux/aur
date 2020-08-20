# Maintainer: berberman <hatsue@typed.icu>

_hkgname=hspec-golden
pkgname=haskell-hspec-golden
pkgver=0.1.0.3
pkgrel=1
pkgdesc="Golden tests for hspec."
url="https://github.com/stackbuilders/hspec-golden"
license=('custom:BSD3')
arch=('x86_64')
depends=('ghc-libs' 'haskell-hspec-core' 'haskell-optparse-applicative')
makedepends=('ghc' 'haskell-hspec' 'haskell-hspec-core' 'haskell-silently')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('9418291aed76e7654591074a04e0ff4b25b2443f8b628370983c3860c958aab4')

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
    LC_CTYPE=en_US.UTF-8 runhaskell Setup test || warning "Test failed!"
}

package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
 
