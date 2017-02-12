# Maintainer: Ivan Wu <2967948168@qq.com>
pkgname=adblock2privoxy
pkgver=1.4.2
pkgrel=1
pkgdesc="Convert adblock config files to privoxy format"
arch=('i686' 'x86_64')
url="https://projects.zubr.me/wiki/adblock2privoxy"
license=('GPL')
depends=('zlib' 'gmp')
makedepends=('stack')
source=("http://hackage.haskell.org/package/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('eb04789e8fc785607f70658870c1b53d') #generate with 'makepkg -g'

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  stack setup
  stack install cabal-install
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  stack build --only-dependencies
  stack exec --no-ghc-package-path runhaskell -- Setup.hs configure --user --prefix=/usr --package-db=clear --package-db=global --package-db="$(stack path --snapshot-pkg-db)" --package-db="$(stack path --local-pkg-db)" --docdir=/usr/share/doc/$pkgname --datasubdir=""
  stack exec --no-ghc-package-path runhaskell -- Setup.hs build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  stack exec --no-ghc-package-path runhaskell -- Setup.hs copy --destdir=$pkgdir
}

# vim:set ts=2 sw=2 et:
