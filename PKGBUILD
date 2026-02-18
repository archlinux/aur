# Maintainer: Max <ulidtko@gmail.com>

_hkgname=extensions
pkgname=haskell-extensions
pkgver=0.1.1.0
pkgrel=1
pkgdesc="Parse Haskell Language Extensions"
url="https://github.com/kowainik/extensions"
license=("MPL-2.0")
arch=('x86_64')
depends=('ghc-libs' 'haskell-colourista' 'haskell-optparse-applicative')
makedepends=(ghc haskell-hedgehog haskell-hspec haskell-hspec-hedgehog uusi)

source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz"
        0002-wider-compat-with-cabal-syntax.patch
        )
sha256sums=('070e1925eb8fdb04b24798c886b0614e52b9ee6f2a5e66decf01dd01dc8c10ed'
            '01403d83a4b7db23063f7c34ced4b54d28b33a2a8fc9f125368d81393320ae4b')

prepare() {
  cd "$_hkgname-$pkgver"
  #--
  #-- NOTE: In 0.1.0.1 onwards, upstream has decided to only support latest Cabal, and had
  #-- drastically reduced compatibility range (Cabal >=3.14), tightening version bounds.
  #--
  #-- GHC 9.6.6 ships with Cabal 3.10; and Cabal is not a small library (~50 MiB built).
  #--
  #-- With this patch, the extensions library can link with much older Cabal-syntax,
  #-- (a version of which always ships with GHC, btw) -- saving compile times and disk space.
  #--
  #-- See upstream issue https://github.com/kowainik/extensions/issues/111
  #-- and rejected PR https://github.com/kowainik/extensions/pull/112
  #--
  patch -p1 < ../0002-wider-compat-with-cabal-syntax.patch
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
