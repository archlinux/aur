# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Arch Haskell Team <>
# Contributor: Lex Black <autumn-wind at web dot de>

_hkgname=digest
pkgname=haskell-digest
pkgver=0.0.1.2
pkgrel=1
pkgdesc='Various cryptographic hashes for bytestrings; CRC32 and Adler32 for now.'
url="http://hackage.haskell.org/package/$_hkgname"
license=(custom:BSD3)
arch=('i686' 'x86_64')
depends=('ghc' 'zlib')
source=("http://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=('641717eb16392abf8965986a9e8dc21eebf1d97775bbb6923c7b7f8fee17fe11')

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
  ln -s /usr/share/doc/$pkgname/html "$pkgdir/usr/share/doc/ghc/html/libraries/${_hkgname}"
  runhaskell Setup copy --destdir="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
