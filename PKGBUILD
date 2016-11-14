# Maintainer : Damien Flament <damien.flament___at___gmx___dot___com>
# Contributor: Daniel Nagy <danielnagy___at___gmx___dot___de>

_hkgname=archlinux

pkgname=haskell-archlinux
pkgver=1.3
pkgrel=4
pkgdesc="Support for working with Arch Linux packages."
arch=('i686' 'x86_64')
url="https://github.com/archhaskell/archlinux"
license=("BSD3")
depends=("ghc")
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='INSTALL'
changelog=()
source=("http://hackage.haskell.org/packages/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "Hide_Data-Monoid_function.patch"
        "Add_FlexibleInstances.patch"
        "Adapt_to_Applicative-Monad.patch"
        "Adapt_to_Cabal_1-22.patch")
noextract=()
md5sums=('13b2e9336b31b3f7a3e5410308023ae5'
         'db16c7d948f0aed4909ae6a0bf7180a8'
         '6a9bed2c0bb13fbc925a40c4571a7330'
         '444868f76ba946afc96676eb47be1b81'
         '228927282cee988a52255ef58e7e2f32')
validpgpkeys=()

prepare() {
  cd ${srcdir}/${_hkgname}-${pkgver}

  patch -Np1 -i "${srcdir}/Hide_Data-Monoid_function.patch"
  patch -Np1 -i "${srcdir}/Add_FlexibleInstances.patch"
  patch -Np1 -i "${srcdir}/Adapt_to_Applicative-Monad.patch"
  patch -Np1 -i "${srcdir}/Adapt_to_Cabal_1-22.patch"
}

build() {
  cd ${_hkgname}-${pkgver}

  runhaskell Setup configure --ghc -O \
                             --prefix='/usr' \
                             --libsubdir='$compiler/site-local/$pkgid' \
                             --docdir=\$prefix/share/doc/${pkgname}
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
}

package() {
  cd ${_hkgname}-${pkgver}

  install -D -m744 -t ${pkgdir}/usr/share/haskell/${pkgname} \
          register.sh unregister.sh

  runhaskell Setup copy --destdir=${pkgdir}

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
