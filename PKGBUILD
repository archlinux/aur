# Maintainer: Aaron Peschel <aaron.peschel via gmail dot com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>
_hkgname=syb
pkgname=haskell-syb
pkgver=0.4.2
pkgrel=2
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
md5sums=('5dae1c576c3139931574c397c996cf19')

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
