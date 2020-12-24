# Maintainer: Jelle van der Waa <jelle@archlinux.org

pkgname=taskell
pkgver=1.10.1
pkgrel=63
pkgdesc='A command-line kanban board/task manager'
license=(BSD)
arch=(x86_64)
url="https://hackage.haskell.org/package/$pkgname"
depends=(ghc-libs haskell-aeson haskell-attoparsec haskell-brick haskell-config-ini haskell-file-embed haskell-fold-debounce haskell-http-client haskell-http-conduit haskell-http-types haskell-lens haskell-tz haskell-vty haskell-classy-prelude)
makedepends=(ghc uusi haskell-classy-prelude haskell-raw-strings-qq haskell-tasty haskell-tasty-discover haskell-tasty-expected-failure haskell-tasty-hunit)
source=(https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('5ef1504f908876aa17dfd817115bc0d1f8056cba4b759ee70b3d869bd778db7ca0123585f107c906b898d5c614091cb05955cb387a03f2abfbe842622e2e4c8e')

prepare() {
  uusi $pkgname-$pkgver/$pkgname.cabal
}

build() {
  cd $pkgname-$pkgver
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
    --datasubdir=$pkgname \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'
  runhaskell Setup build $MAKEFLAGS
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd $pkgname-$pkgver
  runhaskell Setup test
}

package() {
  cd $pkgname-$pkgver
  runghc Setup.hs copy --destdir="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Doc only contains the license
  rm -rf "$pkgdir/usr/share/doc"
}

# vim: ts=2 sw=2 et:
