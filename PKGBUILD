# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo.com>

_hkgname=svgcairo
pkgname=haskell-svgcairo
pkgver=0.13.2.1
pkgrel=1
pkgdesc="Binding to the libsvg-cairo library."
url="http://projects.haskell.org/gtk2hs/"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-cairo' 'haskell-glib' 'librsvg')
makedepends=('ghc' 'haskell-gtk2hs-buildtools')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('48aacf725ca5da00b1977dff91941b1dc72cd56ce5af1a4123e7983d9c2d58a6')

build() {
  cd $_hkgname-$pkgver

  # fix name of header file in svgcairo.h
  sed -i "s/librsvg-features.h/rsvg-features.h/" svgcairo.h

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=haskell-svgcairo --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' 

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
  install -D -m644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/COPYING
}
