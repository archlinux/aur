# $Id$
# Maintainer: Adria Arrufat <adria.arrufat@protonmail.ch>

pkgname=haskell-storable-complex
pkgver=0.2.2
pkgrel=1
pkgdesc="Storable instance for Complex which is binary compatible with C99, C++ and Fortran complex data types"
url="http://hackage.haskell.org/package/storable-complex"
license=("LGPL-3")
arch=('i686' 'x86_64')
makedepends=()
# deps adjusted to specific versions in package()
depends=("ghc")
options=('strip' 'staticlibs')
install="${pkgname}.install"
source=("http://hackage.haskell.org/packages/archive/storable-complex/${pkgver}/storable-complex-${pkgver}.tar.gz")
md5sums=('d18a04e10647672c69b479604d97f17d')

build() {
  cd ${srcdir}/storable-complex-${pkgver}
  runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
    --prefix=/usr --docdir=/usr/share/doc/${pkgname} \
    --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  _ghcver=`pacman -Q ghc | cut -f2 -d\  | cut -f1 -d-`
  depends=("ghc=${_ghcver}")

  cd ${srcdir}/storable-complex-${pkgver}
  install -Dm744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
  install -Dm744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
  install -dm755 ${pkgdir}/usr/share/doc/ghc/html/libraries
  ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/storable-complex
  runhaskell Setup copy --destdir=${pkgdir}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
