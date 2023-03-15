# Maintainer: Marcin Serwin <marcin.serwin0@protonmail.com>

_hkgname=drunken-bishop
pkgname=haskell-drunken-bishop
pkgver=0.1.0.0
pkgrel=1
pkgdesc="An implementation of the Drunken Bishop visual fingerprinting algorithm"
url="https://hackage.haskell.org/package/drunken-bishop"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-puremd5')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz" "setup.patch")
sha256sums=('fe1d43b691a4c49e264ae6d87838d2ec8249e7b4b2b5709f97d5fe8f20128784'
            '7def91926f2e4894a7e1d6abdcb822017bf417597ffbba09a4f7c5945ccfa3b3')

prepare() {
  cd $_hkgname-$pkgver
  patch --forward --strip=1 --input="${srcdir}/setup.patch"
}

build() {
  cd $_hkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    -fno-exe

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
