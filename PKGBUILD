# Maintainer: Daniel Mouritzen <dmrtzn at gmail dot com>

_hkgname=implicit
pkgname=implicitcad
pkgver=0.3.0.1
pkgrel=1
pkgdesc='A math-inspired programmatic 2D & 3D CAD system based on OpenSCAD'
url="http://www.implicitcad.org/"
license=('AGPL3')
arch=('x86_64')
depends=(
  'ghc-libs'

  # library 
  'haskell-blaze-builder'
  'haskell-blaze-markup'
  'haskell-blaze-svg'
  'haskell-bytestring'
  'haskell-containers'
  'haskell-deepseq'
  'haskell-directory'
  'haskell-filepath'
  'haskell-hspec'
  'haskell-juicypixels'
  'haskell-monads-tf'
  'haskell-parallel'
  'haskell-parsec'
  'haskell-storable-endian'
  'haskell-text'
  'haskell-transformers'
  'haskell-vector-space'

  # extopenscad 
  'haskell-filepath'
  'haskell-optparse-applicative'
  'haskell-vector-space'

  # implicitsnap  
  'haskell-bytestring'
  'haskell-snap-core'
  'haskell-snap-server'
  'haskell-text'
  'haskell-vector-space'
)
makedepends=(
  'ghc'

  # Benchmark 
  'haskell-criterion'
)
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('360428a3ac1870d8fc33bd535cde56499d3411404b0a10a34f125812db4804a4')

build() {
  cd "$_hkgname-$pkgver"
    
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir="$pkgname" --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd "$_hkgname-$pkgver"
  runhaskell Setup test
}

package() {
  cd "$_hkgname-$pkgver"

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir" lib:implicit exe:extopenscad
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
