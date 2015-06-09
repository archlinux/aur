# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=stratum-tool
pkgver=0.0.5
pkgrel=1
pkgdesc="Connects to Electrum server via Stratum protocol and allows querying Bitcoin wallet balances and other commands supported by the server"
arch=('i686' 'x86_64')
makedepends=('ghc'
             'haskell-aeson'
             'haskell-async'
             'haskell-bytestring-builder'
             'haskell-cmdargs'
             'haskell-connection'
             'haskell-curl-aeson'
             'haskell-network'
             'haskell-stm'
             'haskell-unordered-containers'
             'haskell-vector')
url="https://github.com/zouppen/stratum-tool"
license=('AGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/zouppen/$pkgname/tar.gz/v$pkgver)
sha256sums=('4dec8c02050f9211b9b690ecfb8f324b86b982ca0bcee7682574df4038be864f')
options=('strip')
install=stratum-tool.install

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  runhaskell Setup configure \
              --prefix=/usr \
              --docdir=/usr/share/doc/stratum-tool \
              --enable-split-objs \
              --enable-shared \
              -O -p
  runhaskell Setup build
  runhaskell Setup haddock
  # runhaskell Setup register --gen-script
  # runhaskell Setup unregister --gen-script
  # sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  msg 'Installing...'
  # install -Dm 744 register.sh "$pkgdir/usr/share/haskell/$pkgname/register.sh"
  # install -Dm 744 unregister.sh "$pkgdir/usr/share/haskell/$pkgname/unregister.sh"
  install -dm 755 "$pkgdir/usr/share/doc/ghc/html/libraries"
  ln -s /usr/share/doc/$pkgname/html "$pkgdir/usr/share/doc/ghc/html/libraries/$pkgname"
  runhaskell Setup copy --destdir=$pkgdir
  rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
