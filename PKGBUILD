# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Don Stewart <dons@galois.com>
# Contributor: Lex Black <autumn-wind at web dot de>

_hkgname=xml
pkgname=haskell-xml
pkgver=1.3.13
pkgrel=2
pkgdesc="A simple XML library."
url="http://code.galois.com"
license=(custom:BSD3)
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc" "haskell-bytestring" "haskell-text")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=('c33607cef8a48d878b0e617e115135fc6f025fe43dcb65c2c7afb8285415b813')

build() {
  cd "$srcdir/$_hkgname-$pkgver"
  runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
