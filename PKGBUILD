# Maintainer: Chan Beom Park <cbpark@gmail.com>

_hkgname=gtk
pkgname=haskell-gtk2
pkgver=0.15.0
pkgrel=1
pkgdesc="The core library of the Gtk2Hs suite of libraries for Haskell based on Gtk+."
url="http://hackage.haskell.org/package/${_hkgname}"
arch=('x86_64')
license=('LGPL-2.1')
makedepends=('ghc' 'haskell-gtk2hs-buildtools')
depends=('ghc-libs' 'haskell-mtl' 'haskell-text' 'haskell-glib' 'haskell-pango' 'haskell-cairo' 'gtk2')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('70aa55d400c23ecb6327acaf596c91002d1f8a5277fc1ff7ef1d360b1890c0e508035ac0378ce6018afd486120173e651ce127dc56aa7ca1c03817f82f22a83e')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
