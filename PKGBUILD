# Maintainer: Firas Zaidan <firas@zaidan.de>

pkgname=yeganesh
pkgdesc='dmenu with a sense of history (cabal sandbox build)'
pkgver=2.5
pkgrel=26

url='http://dmwit.com/yeganesh/'
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs'
         'dmenu'
         'haskell-base'
         'haskell-containers'
         'haskell-directory'
         'haskell-filepath'
         'haskell-process'
         'haskell-strict'
         'haskell-time'
         'haskell-unix'
         'haskell-xdg-basedir')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('3db8ec028b611992a4df251c6d14e6937179f41bff61560bc0095036e38952c125b5ce8663b8fd2f1e5a89da321d9195c850f83101f0910d86a666c335dc3403')

build() {
  cd ${pkgname}-${pkgver}

  runhaskell Setup configure -O \
    --enable-shared \
    --enable-executable-dynamic \
    --disable-library-vanilla \
    --prefix=/usr \
    --dynlibdir=/usr/lib \
    --docdir="/usr/share/doc/${pkgname}" \
    --datasubdir="${pkgname}" \
    --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'
  runhaskell Setup build
}

package() {
  cd ${pkgname}-${pkgver}

  runhaskell Setup.lhs copy --destdir="${pkgdir}"

  # Requires pandoc, regex-posix, Pretty and cabal
  #runhaskell util/GenerateManpage.hs
  rm -r "${pkgdir}/usr/share/doc"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
