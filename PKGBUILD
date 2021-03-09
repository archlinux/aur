# Maintainer: berberman <hatsue@typed.icu>

_hkgname=dependent-sum
pkgname=haskell-dependent-sum
pkgver=0.7.1.0
pkgrel=1
pkgdesc="Dependent sum type"
url="https://github.com/obsidiansystems/dependent-sum"
license=("custom:PublicDomain")
arch=('x86_64')
depends=('ghc-libs' 'haskell-constraints-extras' 'haskell-some')
makedepends=('ghc' 'uusi')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('81cb55907f321f62bea095ae72e9711095c4cb7378fa66fbabc483a9f61b462a')

prepare() {
  cd $_hkgname-$pkgver
  uusi -u some $_hkgname.cabal
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

package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
}
