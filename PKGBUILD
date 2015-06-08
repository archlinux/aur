# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=haskell-aeson
_hkgname=aeson
pkgver=0.8.0.2
pkgrel=2
pkgdesc="A JSON parsing and encoding library optimized for ease of use and high performance."
url="https://github.com/bos/aeson"
license=("GPL")
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=(haskell-attoparsec haskell-unordered-containers haskell-mtl
         haskell-syb haskell-vector haskell-dlist)
source=("http://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-${pkgver}.tar.gz")
options=('strip' 'staticlibs')
install=$pkgname.install
md5sums=('33f09a236e47dfa87f5fb292f48d189a')

build() {
  cd "$srcdir/$_hkgname-$pkgver"
  runhaskell Setup configure -O --enable-split-objs --enable-shared \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname \
    --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir/$_hkgname-$pkgver"
  install -Dm744 register.sh "$pkgdir/usr/share/haskell/$pkgname/register.sh"
  install -m744 unregister.sh "$pkgdir/usr/share/haskell/$pkgname/unregister.sh"
  install -dm755 "$pkgdir/usr/share/doc/ghc/html/libraries"
  ln -s /usr/share/doc/$pkgname/html "$pkgdir/usr/share/doc/ghc/html/libraries/$_hkgname"
  runhaskell Setup copy --destdir="$pkgdir"
  rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
