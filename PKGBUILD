# Maintainer: Colin Woodbury <colingw@gmail.com>
_hkgname=aur
pkgname=haskell-aur
pkgver=4.0.0
pkgrel=1
pkgdesc="Access metadata from the Arch Linux User Repository."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL-3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc'
         'haskell-aeson<1'
         'haskell-aeson-pretty<1'
         'haskell-filepath'
         'haskell-lens<5'
         'haskell-lens-aeson'
         'haskell-mtl'
         'haskell-text'
         'haskell-vector<0.11'
         'haskell-wreq>=0.4')
options=('strip' 'staticlibs')
provides=('haskell-aur')
conflicts=('haskell-aur-git')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('89a039c074e81b6038fb47b8c05778fa')
install=${pkgname}.install
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
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
}
