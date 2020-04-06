# Maintainer: Firas Zaidan <firas@zaidan.de>

pkgname=erd
pkgdesc='A utility for generating entity-relationship diagrams from plain-text descriptions'
pkgver=0.2.1.0
pkgrel=1

url='https://github.com/BurntSushi/erd'
license=('Unlicense')
arch=('i686' 'x86_64')
depends=('ghc-libs'
         'haskell-base'
         'haskell-bytestring'
         'haskell-containers'
         'haskell-directory'
         'haskell-filepath'
         'haskell-gitrev'
         'haskell-graphviz'
         'haskell-parsec'
         'haskell-raw-strings-qq'
         'haskell-text'
         'haskell-yaml')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('bb21d17401c4b4d9e3c7c6293f4550141b29502c8244a4487ff99ec19b18b3db3c4e322fdf246230304ee8509e4cb2aa250caecf119421fbfa085f97723ca638')

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

  runhaskell Setup.hs copy --destdir="${pkgdir}"
  rm -r "${pkgdir}/usr/share/doc"
  install -Dm 644 UNLICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
