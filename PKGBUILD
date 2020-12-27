# Maintainer:  he7086 <heyi7086<AT>gmail<DOT>com>

pkgname=haskell-with-utf8
_hkgname=with-utf8
pkgver=1.0.2.1
pkgrel=2
pkgdesc="Get your IO right on the first try"
url="http://hackage.haskell.org/package/with-utf8"
license=("MPL")
arch=('x86_64')
depends=('ghc-libs' 'haskell-th-env' 'haskell-safe-exceptions')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-${pkgver}.tar.gz")
sha512sums=('4a55e85113de82217440daaf134f56e672f7b0987174932ccbc763cc0b563ff4198d2a474db996b500d6f66907b6d69f789e283f067ab950f75b178b412da596')

build() {
  cp "$startdir/Setup.hs" "$_hkgname-$pkgver/Setup.hs"
  cd $_hkgname-$pkgver
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
            -f-developer -f-fast -f-cffi
  runhaskell Setup build $MAKEFLAGS
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd $_hkgname-$pkgver

  install -Dm644 LICENSES/MPL-2.0.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -Dm744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
