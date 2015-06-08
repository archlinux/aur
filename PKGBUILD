# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Arch Haskell Team <>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=haskell-blaze-builder
_hkgname=blaze-builder
pkgver=0.4.0.1
pkgrel=1
pkgdesc="Efficient buffered output."
url="https://github.com/lpsmith/blaze-builder"
license=(custom:BSD3)
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=('haskell-bytestring' 'haskell-text')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
options=( 'strip' 'staticlibs' )
install="$pkgname.install"
md5sums=('97fd54eb400f8f7170ec57f8b1e3e6af')

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
