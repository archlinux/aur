# Maintainer: berberman <hatsue@typed.icu>

_hkgname=relude
pkgname=haskell-relude
pkgver=0.7.0.0
pkgrel=1
pkgdesc="Safe, performant, user-friendly and lightweight Haskell Standard Library."
url="https://github.com/kowainik/relude"
license=('MIT')
arch=('x86_64')
depends=('ghc-libs' 'haskell-unordered-containers' 'haskell-hashable')
makedepends=('ghc' 'haskell-gauge' 'haskell-unordered-containers' 'haskell-doctest' 'haskell-hashable' 'haskell-glob')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz"
        Setup.hs
)
sha256sums=('c7492118453176e9ffbfca6c6723d4429d1d11f2133325ce06e87353cc80a1bf' '1e1679046e10c31286fee3e631e57e4ef60c89e562270c8a2a7131c051959916')

prepare(){
  cd $_hkgname-$pkgver

  cp ../Setup.hs Setup.hs
}

build() {
  cd $_hkgname-$pkgver    
    
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --enable-tests --disable-library-vanilla \
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
 
