# Maintainer: he7086 <heyi7086<AT>gmail<DOT>com>

pkgname=haskell-hie-bios
_hkgname=hie-bios
pkgver=0.7.2
pkgrel=1
pkgdesc="Set up a GHC API session"
url="http://hackage.haskell.org/package/hie-bios"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-cryptohash-sha1')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-${pkgver}.tar.gz")
sha512sums=('cf531db5cb08f26e47366cc653bb9fd4b2e82c088a7cb2163701920e98b4b82c158c74e14195e314e6eb59cc0b0d15d3a6c628babb30790a3765f1d6945f28ec')

build() {
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

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -Dm744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
