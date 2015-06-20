# Maintainer: Dimitri Sabadie <dimitri.sabadie@gmail.com>

pkgname=msi-kb-backlit
pkgver=0.1.0.1
pkgrel=1
pkgdesc='A command line tool to change backlit colors of your MSI keyboard'
arch=('any')
url=https://hackage.haskell.org/package/$pkgname
license=('custom:BSD3')
makedepends=('ghc<7.11' 'cabal-install<1.23')
install=$pkgname.install
source=("http://hackage.haskell.org/package/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8437ed623ae07c5350d24b5b8f96ac82fdade7afe9cd6a6085b39103475001d3')

build() {
  cabal update

  cd $pkgname-$pkgver
  cabal sandbox init
  cabal install --only-dependencies --disable-documentation --disable-profiling
  cabal configure \
    -O2 \
    --enable-executable-stripping \
    --enable-split-objs \
    --disable-debug-info \
    --disable-profiling
  cabal build
}

package() {
  cd $srcdir/$pkgname-$pkgver

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m744 CHANGELOG.md $pkgdir/usr/share/$pkgname/CHANGELOG.md

  install -D -m744 dist/build/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}
