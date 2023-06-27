# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=haskell-bytestring-builder
pkgver=0.10.8.2.0
pkgrel=1
pkgdesc="Provides methods for fully evaluating data structures (deep evaluation)"
arch=('i686' 'x86_64')
makedepends=('ghc')
url="https://github.com/lpsmith/bytestring-builder"
license=('BSD3')
source=(${pkgname#haskell-}-$pkgver.tar.gz::https://codeload.github.com/lpsmith/${pkgname#haskell-}/tar.gz/v$pkgver)
sha256sums=('bd526451a59582faee30900fda7f140094202abe6966d0578e32eaf3c999a623')
options=('strip')

build() {
  cd "$srcdir/${pkgname#haskell-}-$pkgver"

  msg2 'Building...'
  runhaskell Setup configure \
              --prefix=/usr \
              --docdir=/usr/share/doc/bytestring-builder \
              --enable-split-objs \
              --enable-shared \
              -O -p
  runhaskell Setup build
  #runhaskell Setup haddock
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir/${pkgname#haskell-}-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname#haskell-}/LICENSE"

  msg2 'Installing...'
  install -Dm 744 register.sh "$pkgdir/usr/share/haskell/${pkgname#haskell-}/register.sh"
  install -Dm 744 unregister.sh "$pkgdir/usr/share/haskell/${pkgname#haskell-}/unregister.sh"
  install -dm 755 "$pkgdir/usr/share/doc/ghc/html/libraries"
  ln -s /usr/share/doc/${pkgname#haskell-}/html "$pkgdir/usr/share/doc/ghc/html/libraries/${pkgname#haskell-}"
  runhaskell Setup copy --destdir=$pkgdir
  rm -f "$pkgdir/usr/share/doc/${pkgname#haskell-}/LICENSE"
}
