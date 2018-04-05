# Maintainer: Flaviu Tamas <aur@flaviutamas.com>
pkgname=bnfc
pkgver=2.8.1
pkgrel=3
pkgdesc="The BNF Converter is a compiler construction tool generating a compiler front-end from a Labelled BNF grammar. It is currently able to generate C, C++, C#, Haskell, Java, and OCaml, as well as XML representations."
url="http://bnfc.digitalgrammars.com/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('gmp')
makedepends=('ghc' 'cabal-install' 'haskell-haddock-library' 'happy' 'alex' 'haskell-mtl')
optdepends=(
  'ghc: haskell output'
  'happy: haskell output'
  'alex: haskell output'
)
source=("https://github.com/BNFC/bnfc/archive/v${pkgver}.tar.gz")

sha256sums=('cbf46514fecc9998b56f6ab3d27505eeab3db106e4638d9b4e64acef58699a41')

build() {
  cd "${pkgname}-${pkgver}/source"

  cabal sandbox init
  export PATH="$PWD/.cabal-sandbox/bin:$PATH"

  cabal update

  cabal configure -v \
    --prefix=/usr \
    --libsubdir='$pkg' \
    --datasubdir='$pkg' \
    --docdir='$datadir/doc/$pkg' \
    --enable-shared --enable-executable-dynamic --disable-library-vanilla  # magic incantation to get this to work on arch linux

  cabal build
}

package() {
  cd "${pkgname}-${pkgver}/source"

  cabal sandbox init
  export PATH="$PWD/.cabal-sandbox/bin:$PATH"

  cabal copy --destdir="${pkgdir}/"
  rm -r "${pkgdir}/usr/lib"
}

# vim:set ts=2 sw=2 et:
