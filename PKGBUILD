# Maintainer: Aaron Peschel <aaron.peschel via gmail dot com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>
_hkgname=syb
pkgname=haskell-syb
pkgver=0.4.4
pkgrel=1
pkgdesc="A library for client-side HTTP"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=(
    'ghc>=6.0.0'
    'ghc<7.10.0'
    'haskell-base>=4.0'
    'haskell-base<5.0'
)
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
options=('staticlibs')
sha1sums=('93b01feab9b0868e266174f188e618d57af5a347')
sha256sums=('0610677803931a3355aae00fdd13145f80e26d7dee08e1ba5bc9b2edea4c4c87')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O -p --enable-split-objs --enable-shared --prefix=/usr --docdir=/usr/share/doc/${pkgname}
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
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
