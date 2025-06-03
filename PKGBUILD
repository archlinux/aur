# Maintainer: MajorX234 <majorx234 at gmail dot com>
_hkgname=text
pkgname=haskell-text
pkgver=2.1.2
pkgrel=1
pkgdesc="An efficient packed Unicode text type."
url="An efficient packed Unicode text type."
license=('custom:BSD3')
arch=('x86_64')
depends=('ghc-libs')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha512sums=('ec91b3b1d459a3eb287411b4b334c525b655c801e9d38ee931de7f8e8432bbdbc67b06357fdd8ee06e79b68a7cf02a36b7e437970270eecdd6c66885c9331241')

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
