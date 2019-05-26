pkgname=haskell-ordered-containers
pkgver=0.2.1
pkgrel=2
pkgdesc="Set and Map-like types that remember the order elements were inserted"
arch=('i686' 'x86_64')
makedepends=('ghc' 'ghc-libs' 'haskell-containers')
depends=('haskell-containers')
url="https://github.com/dmwit/ordered-containers"
license=('BSD3')
source=(https://hackage.haskell.org/package/${pkgname#haskell-}-$pkgver/${pkgname#haskell-}-$pkgver.tar.gz)
sha256sums=('01d427fd6bc2f2dabed69f2036f4d228fd8bed9fcde39eeb12ad53e73da795f9')

build() {
  cd "$srcdir/${pkgname#haskell-}-$pkgver"

  msg 'Building...'
  runhaskell Setup configure \
              --prefix=/usr \
              --docdir="/usr/share/doc/${pkgname}" \
              --enable-shared \
              --enable-executable-dynamic \
              --disable-library-vanilla \
              --dynlibdir=/usr/lib \
              --libsubdir=\$compiler/site-local/\$pkgid \
              -O
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir/${pkgname#haskell-}-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg 'Installing...'
  install -Dm 744 register.sh "$pkgdir/usr/share/haskell/register/$pkgname.sh"
  install -Dm 744 unregister.sh "$pkgdir/usr/share/haskell/unregister/$pkgname.sh"
  runhaskell Setup copy --destdir="$pkgdir"
  rm -f "$pkgdir/usr/share/doc/${pkgname#haskell-}/LICENSE"
}
