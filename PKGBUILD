# Maintainer: he7086 <heyi7086<AT>gmail<DOT>com>

pkgname=haskell-th-env
_hkgname=th-env
pkgver=0.1.0.2
pkgrel=1
pkgdesc="Template Haskell splice that expands to an environment variable"
url="http://hackage.haskell.org/package/th-env"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-${pkgver}.tar.gz")
sha512sums=('d820135a97752c3579a2ee98462342a111be7a674a1fc30acd98d6925b8d8a22766e397d3112be2dc5c75e9c93211d5b5018c8598b4268069c0809b0e66b93a7')

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
