# Maintainer: Max <ulidtko@gmail.com>

_hkgname=slist
pkgname=haskell-slist
pkgver=0.2.0.0
pkgrel=1
pkgdesc="Sized list"
url="https://github.com/kowainik/slist"
license=("MPL2")
arch=('x86_64')
depends=('ghc-libs')
makedepends=(ghc haskell-glob haskell-doctest haskell-hedgehog haskell-hspec haskell-hspec-hedgehog uusi)
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('266d59c2e46059c7c7f613fcf29da24eef08b3f4cf4bd85422b7e73120e73aaa')

build() {
  cd $_hkgname-$pkgver
  gen-setup && uusi --all $_hkgname.cabal

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
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
