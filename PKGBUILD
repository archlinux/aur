# Maintainer: Max <ulidtko@gmail.com>

_hkgname=unix
pkgname=haskell-unix
pkgver=2.8.8.0
pkgrel=1
pkgdesc="POSIX functionality (backport)"
url="https://github.com/haskell/unix"
license=("BSD-3-Clause")
arch=('x86_64')
depends=(haskell-base haskell-bytestring
        'haskell-filepath>=1.4.100'
        haskell-os-string haskell-time)
makedepends=('ghc'
             haskell-tasty-hunit haskell-tasty-quickcheck)

source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('a128dea3bfeb731a562f22d376fa606e902154d95321363f7ec1ea6b787a5a3e')

#-- Packager NOTE: this is a backport.

build() {
  cd $_hkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    -f-cpphs

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
