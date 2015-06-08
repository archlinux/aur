# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_hkgname=webkit
pkgname=haskell-webkit
pkgver=0.13.1.1
pkgrel=1
pkgdesc="Binding to the Webkit library."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('LGPL-2.1')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-cairo>=0.13' 'haskell-bytestring' 'haskell-text' 'haskell-mtl' 'haskell-glib>=0.13' 'haskell-gtk>=0.13'  'haskell-pango>=0.13' 'libwebkit' 'gtk2hs-buildtools' 'gtk2hs-buildtools' 'gtk2hs-buildtools')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O --enable-split-objs --enable-shared \
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
sha256sums=('e53792e0c806d4a3de5ff929cf7d7e8c411db7169e84ce2a565201cc9356a218')
