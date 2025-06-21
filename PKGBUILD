# Maintainer: Max <ulidtko@gmail.com>

_hkgname=extensions
pkgname=haskell-extensions
pkgver=0.1.0.3
pkgrel=1
pkgdesc="Parse Haskell Language Extensions"
url="https://github.com/kowainik/extensions"
license=("MPL-2.0")
arch=('x86_64')
depends=('ghc-libs' 'haskell-colourista' 'haskell-optparse-applicative')
makedepends=(ghc haskell-hedgehog haskell-hspec haskell-hspec-hedgehog uusi)
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz"
        "0001-switch-to-Cabal-syntax-allow-cabal-3.8-.-3.14.patch"
        )
sha256sums=('95fef562d93a63146bd1a99b653023462610a9c97648c67660f283d99c0f7aba'
            '0f549524ad59f36a48ce5b39993f28595767b6e33ecf5afbac733caa5738e711')

prepare() {
  cd "$_hkgname-$pkgver"
  #-- NOTE: 0.1.0.1 and later is incompatible with GHC 9.4.8.
  #-- See upstream issue https://github.com/kowainik/extensions/issues/111
  #-- and rejected PR https://github.com/kowainik/extensions/pull/112
  #-- This patch adds compatibility backports.
  patch -p1 < ../0001-switch-to-Cabal-syntax-allow-cabal-3.8-.-3.14.patch
}

build() {
  cd $_hkgname-$pkgver
  gen-setup && uusi --all $_hkgname.cabal

  runhaskell Setup configure -O \
    --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd $_hkgname-$pkgver
  runhaskell Setup test
}

package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
