# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=haskell-bytestring-builder
pkgver=0.10.6.0.0
pkgrel=1
pkgdesc="Provides methods for fully evaluating data structures (deep evaluation)"
arch=('i686' 'x86_64')
makedepends=('ghc')
url="https://github.com/lpsmith/bytestring-builder"
license=('BSD3')
source=(${pkgname#haskell-}-$pkgver.tar.gz::https://codeload.github.com/lpsmith/${pkgname#haskell-}/tar.gz/v$pkgver)
sha256sums=('ae682f7fa49092cd9ec5f022de49d343e553a5e86d805692228de1cb496afe5f')
options=('strip')
install=bytestring-builder.install

build() {
  cd "$srcdir/${pkgname#haskell-}-$pkgver"

  msg 'Building...'
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

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname#haskell-}/LICENSE"

  msg 'Installing...'
  install -Dm 744 register.sh "$pkgdir/usr/share/haskell/${pkgname#haskell-}/register.sh"
  install -Dm 744 unregister.sh "$pkgdir/usr/share/haskell/${pkgname#haskell-}/unregister.sh"
  install -dm 755 "$pkgdir/usr/share/doc/ghc/html/libraries"
  ln -s /usr/share/doc/${pkgname#haskell-}/html "$pkgdir/usr/share/doc/ghc/html/libraries/${pkgname#haskell-}"
  runhaskell Setup copy --destdir=$pkgdir
  rm -f "$pkgdir/usr/share/doc/${pkgname#haskell-}/LICENSE"
}
