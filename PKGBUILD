# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo.com>

_hkgname=ghc-vis
pkgname=haskell-ghc-vis
pkgver=0.9.3
pkgrel=1
pkgdesc="Live visualization of data structures in GHCi"
url="http://felsin9.de/nnis/ghc-vis"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-cairo' 'haskell-fgl' 'haskell-ghc-heap-view' 'haskell-graphviz' 'haskell-gtk3' 'haskell-svgcairo' 'haskell-xdot' 'graphviz')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('ef6adb7fa081ad0b00fdd3a74d3019388d8d1f8877396c6289afaa711d252420')

build() {
  cd $_hkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=haskell-ghc-vis --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    -ffull -fgraph

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
