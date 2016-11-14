# Maintainer: Daniel Nagy <danielnagy at gmx de>

# custom variables
_hkgname=archlinux
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-archlinux
pkgver=1.3
pkgrel=3
pkgdesc="Support for working with Arch Linux packages."
url="http://github.com/archhaskell/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "Hide_Data-Monoid_function.patch")
install="${pkgname}.install"

prepare() {
  cd ${srcdir}/${_hkgname}-${pkgver}

  patch -Np1 -i "${srcdir}/Hide_Data-Monoid_function.patch"
}

build() {
  cd ${srcdir}/${_hkgname}-${pkgver}

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
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
md5sums=('13b2e9336b31b3f7a3e5410308023ae5'
         'db16c7d948f0aed4909ae6a0bf7180a8')
