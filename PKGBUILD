# Maintainer: Jelle van der Waa <jelle@archlinux.org

pkgname=taskell
pkgver=1.9.2.0
pkgrel=25
pkgdesc='A command-line kanban board/task manager'
license=(BSD)
arch=(x86_64)
url="https://hackage.haskell.org/package/$pkgname"
depends=(ghc-libs haskell-aeson haskell-attoparsec haskell-brick haskell-config-ini haskell-file-embed haskell-fold-debounce haskell-http-client haskell-http-conduit haskell-http-types haskell-lens haskell-tz haskell-vty haskell-classy-prelude)
makedepends=(ghc)
source=(https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('4c55922ad9f6c529a8c8ca73602b9f42fa3cda4945fe8edaa554909334445e089db0b7a5ba7f6804bdf618274543fd6598d19802907a0ae661571ed48366376b')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e 's/== *0.50/==0.52/' -e 's/< *4/<5/' -e 's/< *2/<3/' -e 's/< *1/<2/' $pkgname.cabal
}

build() {
  cd $pkgname-$pkgver
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname \
    --datasubdir=$pkgname \
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
  cd $pkgname-$pkgver
  runghc Setup.hs copy --destdir="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Doc only contains the license
  rm -rf "$pkgdir/usr/share/doc"
}

# vim: ts=2 sw=2 et:
