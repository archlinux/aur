# Maintainer: berberman <hatsue@typed.icu>
# Contributor: Emanuel Couto <unit73e at gmail dot com>
# Contributor: Carlos E. Garcia <carlos at cgarcia dot org>
_hkgname=fixed
pkgname=haskell-fixed
pkgver=0.3
pkgrel=1
pkgdesc="Signed 15.16 precision fixed point arithmetic"
url="http://github.com/ekmett/fixed"
license=('custom:BSD3')
arch=('x86_64')
depends=('ghc-libs')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('9218ebd3af3f07335db8dcd148b3ce40acf984734c244cce5959f57402d48282')

build() {
  cd $_hkgname-$pkgver    
    
  runhaskell Setup configure -O --enable-shared --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build
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
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
