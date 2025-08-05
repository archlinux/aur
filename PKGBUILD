# Maintainer: Vekhir <vekhir AT yahoo DOT com>

pkgname=hedgewars-server-hg
pkgver=r16107+.a45c091b6ce0+
pkgrel=1
pkgdesc="Turn-based strategy artillery game similiar to Worms (Server component)"
arch=('x86_64')
url="https://hedgewars.org"
license=('GPL-2.0-only')
depends=('ghc-libs' 'haskell-entropy' 'haskell-sha' 'haskell-random' 'haskell-regex-tdfa'
         'haskell-sandi' 'haskell-hslogger' 'haskell-network' 'haskell-network-bsd'
         'haskell-utf8-string' 'haskell-vector')
makedepends=('mercurial' 'ghc' 'uusi')
provides=('hedgewars-server')
conflicts=('hedgewars' 'hedgewars-hg')
source=("$pkgname::hg+https://hg.hedgewars.org/hedgewars/#branch=1.0.0"
        "$pkgname-server-build-cabal.patch"
        "$pkgname-mtl2.3.patch"
        "$pkgname-bump-network-dep.patch")

sha512sums=('SKIP'
            '048f65cf42a1bc90a9c1ff1022eef6252fcf200ceccdcdee1d2705f4b93feed59be1d822566f6145019921709b3840c8aa37d1bb1b0bafbd1808ad0a5494768d'
            'e134a6b26dfa5451797f328bd21760e271c4bb9b67ebf943026b724969b236c034f4fdb3ff96b34f9876253c5bdb58b1f7a6042958e308324746a4debebd610f'
            '1b7e86c9e2477b196b99dd694182d3aa5a843d2b9573fa5d14281f2ee8e1b946a1671f21573c7e37742ab84c7a7780be22250072e27637feda5b8594d8f79079')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$pkgname"
  patch -p1 -i ../"$pkgname-bump-network-dep.patch"
  patch -p1 -i ../"$pkgname-mtl2.3.patch"
  patch -p1 -i ../"$pkgname-server-build-cabal.patch"

  cd gameServer
  gen-setup
  uusi --nb checker
}

build() {
    cd "$pkgname"/gameServer

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build $MAKEFLAGS
}

package() {
  cd "$pkgname"/gameServer

  runhaskell Setup copy --destdir="$pkgdir"
}
