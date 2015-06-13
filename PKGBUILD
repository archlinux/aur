# Maintainer: Johann Klähn <kljohann@gmail.com>

pkgname=pandoc-cabal
pkgdesc='Conversion between markup formats (cabal sandbox build)'
pkgver=1.14.0.4
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
md5sums=('03eef88935f7940a2f403559966b92df')

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

  install -D -m644 man/man1/pandoc.1 "${pkgdir}/usr/share/man/man1/pandoc.1"
  install -D -m644 man/man5/pandoc_markdown.5 "${pkgdir}/usr/share/man/man5/pandoc_markdown.5"
}
