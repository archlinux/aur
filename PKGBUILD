# Maintainer: Johann Klähn <kljohann@gmail.com>

pkgname=yeganesh-cabal
pkgdesc='dmenu with a sense of history (cabal sandbox build)'
pkgver=2.5
pkgrel=1

url='http://dmwit.com/yeganesh/'
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('dmenu')
makedepends=('ghc')
source=(http://dmwit.com/yeganesh/yeganesh-${pkgver}.tar.gz)
md5sums=('1f64542082d61b9004bc42f80ce9ebac')

_cabal_flags=(--force-reinstalls --reinstall --user)

build() {
  cd "yeganesh-${pkgver}"

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
  cd "yeganesh-${pkgver}"

  cabal sandbox init
  export PATH="$PWD/.cabal-sandbox/bin:$PATH"

  cabal copy --destdir="${pkgdir}/"
  rm -f "${pkgdir}/usr/share/doc/yeganesh/LICENSE"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
