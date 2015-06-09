# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=haskell-curl-aeson
pkgver=0.0.4
pkgrel=1
pkgdesc="Communicate with HTTP service using JSON"
arch=('i686' 'x86_64')
makedepends=('ghc'
             'haskell-aeson'
             'haskell-curl'
             'haskell-text'
             'haskell-utf8-string')
url="https://github.com/zouppen/haskell-curl-aeson"
license=('BSD3')
source=(https://hackage.haskell.org/package/${pkgname#haskell-}-$pkgver/${pkgname#haskell-}-$pkgver.tar.gz)
sha256sums=('3defd8313d3e34657bd4c5aa7f0c4e1b7a6e533eaeffc1571eee2de31021f1ba')
options=('strip')
install=curl-aeson.install

build() {
  cd "$srcdir/${pkgname#haskell-}-$pkgver"

  msg 'Building...'
  runhaskell Setup configure \
              --prefix=/usr \
              --docdir=/usr/share/doc/curl-aeson \
              --enable-split-objs \
              --enable-shared \
              -O -p
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir/${pkgname#haskell-}-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg 'Installing...'
  install -Dm 744 register.sh "$pkgdir/usr/share/haskell/${pkgname#haskell-}/register.sh"
  install -Dm 744 unregister.sh "$pkgdir/usr/share/haskell/${pkgname#haskell-}/unregister.sh"
  install -dm 755 "$pkgdir/usr/share/doc/ghc/html/libraries"
  ln -s /usr/share/doc/${pkgname#haskell-}/html "$pkgdir/usr/share/doc/ghc/html/libraries/${pkgname#haskell-}"
  runhaskell Setup copy --destdir="$pkgdir"
  rm -f "$pkgdir/usr/share/doc/${pkgname#haskell-}/LICENSE"
}
