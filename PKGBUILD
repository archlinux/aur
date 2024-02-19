# Maintainer: Vekhir <vekhir AT yahoo DOT com>

pkgname=hedgewars-server-hg
pkgver=r15991+.00bf5adba849+
pkgrel=1
pkgdesc="Turn-based strategy artillery game similiar to Worms (Server component)"
arch=('x86_64')
url="https://hedgewars.org"
license=('GPL' 'custom')
depends=('ghc-libs' 'haskell-entropy' 'haskell-sha' 'haskell-random' 'haskell-regex-tdfa'
         'haskell-sandi' 'haskell-hslogger' 'haskell-network' 'haskell-network-bsd'
         'haskell-utf8-string' 'haskell-vector')
makedepends=('mercurial' 'ghc' 'uusi')
provides=('hedgewars-server')
conflicts=('hedgewars' 'hedgewars-hg')
source=("$pkgname::hg+https://hedgewars.org:8443/hedgewars/")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$pkgname"
  cd gameServer
  gen-setup
  uusi --nb checker
}

build() {
    cd "$pkgname"/gameServer

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid --ghc-option=-fllvm
    runhaskell Setup build $MAKEFLAGS
}

package() {
  cd "$pkgname"/gameServer

  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 ../COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
