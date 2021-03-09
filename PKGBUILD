# Maintainer: berberman <hatsue@typed.icu>

_hkgname=dependent-sum-template
pkgname=haskell-dependent-sum-template
pkgver=0.1.0.3
pkgrel=1
pkgdesc="Template Haskell code to generate instances of classes in dependent-sum package"
url="https://github.com/obsidiansystems/dependent-sum"
license=("custom:PublicDomain")
arch=('x86_64')
depends=('ghc-libs' 'haskell-dependent-sum' 'haskell-th-extras')
makedepends=('ghc' 'haskell-constraints-extras')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('c8eb17d3fa9966182e041836abefce2e7e42e30d3b01463a254fb7cf806ca4df')

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
}
