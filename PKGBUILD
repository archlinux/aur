# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Martin Harvan <martinhrvn@gmail.com>

_hkgname=gio
pkgname=haskell-gio
pkgver=0.13.0.4
pkgrel=1
pkgdesc="Binding to the GIO."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('LGPL-2.1')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 
    'haskell-array' 
    'haskell-bytestring' 
    'haskell-containers' 
    'haskell-glib<0.13' 'haskell-glib>=0.12'    
    'haskell-mtl' 
    'glib2' 
    'gtk2hs-buildtools')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('c252802fc52c055691e303ca30e4563f')
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
