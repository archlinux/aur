# Maintainer: Johann Klähn <kljohann@gmail.com>

pkgname=pandoc-cabal
pkgdesc='Conversion between markup formats (cabal sandbox build)'
pkgver=1.15.0.6
pkgrel=1

url='http://johnmacfarlane.net/pandoc/'
license=(GPL)
arch=('i686' 'x86_64')
optdepends=('pandoc-citeproc: automatic generation of citations and bibliographies')
options=(!makeflags)
conflicts=(pandoc haskell-pandoc)
provides=("pandoc=$pkgver")
makedepends=(ghc "cabal-install>=1.18" happy alex)
source=("http://hackage.haskell.org/package/pandoc-${pkgver}/pandoc-${pkgver}.tar.gz")
md5sums=('dc3d1d5b1bc23a3de1915614cafd06f9')

_cabal_flags=(--force-reinstalls --reinstall --user)

build() {
  cd "pandoc-${pkgver}"

  cabal sandbox init
  export PATH="$PWD/.cabal-sandbox/bin:$PATH"

  cabal update

  msg "Building dependencies..."
  msg2 "Cabal flags: ${_cabal_flags[*]}"

  which hsb2hs || cabal install "${_cabal_flags[@]}" hsb2hs
  cabal install "${_cabal_flags[@]}" --only-dependencies

  msg "Configuring..."
  cabal configure -v \
    --prefix=/usr \
    --libsubdir='$pkg' \
    --datasubdir='$pkg' \
    --docdir='$datadir/doc/$pkg'

  msg "Starting build..."
  cabal build
}

package() {
  cd "pandoc-${pkgver}"

  cabal sandbox init
  export PATH="$PWD/.cabal-sandbox/bin:$PATH"

  cabal copy --destdir="${pkgdir}/"
  rm -r "${pkgdir}/usr/lib"
}
