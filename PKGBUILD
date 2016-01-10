# $Id$
# Maintainer: Adria Arrufat <adria.arrufat@protonmail.ch>

pkgname=haskell-hmatrix
pkgver=0.17.0.1
pkgrel=1
pkgdesc="Linear systems, matrix decompositions, and other numerical computations based on BLAS and LAPACK"
url="http://hackage.haskell.org/package/hmatrix"
license=("LGPL-3")
arch=('i686' 'x86_64')
makedepends=()
# deps adjusted to specific versions in package()
depends=("ghc" "haskell-random" "haskell-split" "haskell-storable-complex" "haskell-vector" "lapack" "blas")
options=('strip' 'staticlibs')
install="${pkgname}.install"
source=("http://hackage.haskell.org/packages/archive/hmatrix/${pkgver}/hmatrix-${pkgver}.tar.gz")
md5sums=('a4d356f6cdc5d7b03fc1c280fe5bfb66')

build() {
  cd ${srcdir}/hmatrix-${pkgver}
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
  depends=("ghc" "haskell-random" "haskell-split" "haskell-storable-complex" "haskell-vector" "lapack" "blas")

  cd ${srcdir}/hmatrix-${pkgver}
  install -Dm744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
  install -Dm744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
  install -dm755 ${pkgdir}/usr/share/doc/ghc/html/libraries
  ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/hmatrix
  runhaskell Setup copy --destdir=${pkgdir}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
