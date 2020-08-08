# Maintainer: Jelle van der Waa <jelle@archlinux.org

pkgname=taskell
pkgver=1.9.3.0
pkgrel=3
pkgdesc='A command-line kanban board/task manager'
license=(BSD)
arch=(x86_64)
url="https://hackage.haskell.org/package/$pkgname"
depends=(ghc-libs haskell-aeson haskell-attoparsec haskell-brick haskell-config-ini haskell-file-embed haskell-fold-debounce haskell-http-client haskell-http-conduit haskell-http-types haskell-lens haskell-tz haskell-vty haskell-classy-prelude)
makedepends=(ghc haskell-classy-prelude haskell-raw-strings-qq haskell-tasty haskell-tasty-discover haskell-tasty-expected-failure haskell-tasty-hunit)
source=(https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/smallhadroncollider/taskell/raw/master/test/Taskell/IO/data/roadmap.md)
sha512sums=('61d9615d20585345a0a7d8864c7c817196b3ebf9a7ec3aa3f592f0f6df89d14c6c6a9f31ae9cc1060f775b348505b4df5cb3262ced686a6df3dd241797624a44'
            'c41d549a9595f91dc58dfb72eeaca8e1faeafe87255e8b375fe542f015fffb736004bce6ed7b97a3c4493b3b35a53e6ce755698f45a16f736920c8743e7247b8')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/== *0.52/==0.55/;s/== *5.26/==5.30/;s/< *4/<5/;s/< *2/<3/;s/< *1/<2/;s/< *0.7/<1/;s/>=1.2.4.0/>=1.2/' $pkgname.cabal
  cp ../roadmap.md test/Taskell/IO/data/
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
