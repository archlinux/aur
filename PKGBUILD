# Maintainer: Daniel Nagy <danielnagy at gmx de>

_hkgname=json
pkgname=haskell-json
pkgver=0.9.1
pkgrel=1
pkgdesc="Support for serialising Haskell to and from JSON"
url="http://hackage.haskell.org/package/${_hkgname}"
license=(custom:BSD3)
arch=('i686' 'x86_64')
depends=(ghc haskell-array 'haskell-base>=4' haskell-bytestring
         haskell-containers haskell-text haskell-mtl)
source=("http://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install=$pkgname.install
options=('staticlibs')
sha256sums=('96b57e4d167e45dc80aeff872a922ae9cdb953a1ded29ebbb51019b68f0085a2')

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
  install -D -m744 register.sh "$pkgdir/usr/share/haskell/$pkgname/register.sh"
  install -m744 unregister.sh "$pkgdir/usr/share/haskell/$pkgname/unregister.sh"
  install -d -m755 "$pkgdir/usr/share/doc/ghc/html/libraries"
  ln -s /usr/share/doc/$pkgname/html "$pkgdir/usr/share/doc/ghc/html/libraries/${_hkgname}"
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
