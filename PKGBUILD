# Maintainer: Max <ulidtko@gmail.com>

_hkgname=directory-ospath-streaming
pkgname=haskell-directory-ospath-streaming
pkgver=0.2.2
pkgrel=2
pkgdesc="Stream directory entries in constant memory in vanilla IO"
url="https://github.com/sergv/directory-ospath-streaming"
license=("Apache-2.0")
arch=('x86_64')
depends=('ghc-libs'
         'haskell-filepath>=1.4.100'
         'haskell-directory>=1.3.8'
         'haskell-unix>=2.8'
         'haskell-atomic-counter' 'haskell-os-string')
#makedepends=('ghc' 'haskell-random' 'haskell-tasty' 'haskell-tasty-hunit')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz"
       Setup.hs)
sha256sums=('1ade8fbee13db15e8d22a1ecdca54794617cabc69911b51d46a65e12f4554ef7'
            '5066653559d4d6134b022d66a634a17fdcf8db35d28b447e581fec284afa4689')

prepare() {
  #-- the package does not come with a Setup.hs, use the simplest default
  mv -v Setup.hs $_hkgname-$pkgver/
}

build() {
  cd $_hkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname \
    --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    -fos-string

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
