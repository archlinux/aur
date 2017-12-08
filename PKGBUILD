# Maintainer: Chan Beom Park <cbpark@gmail.com>

_hkgname=gtk
pkgname=haskell-gtk2
pkgver=0.14.7
pkgrel=1
pkgdesc="The core library of the Gtk2Hs suite of libraries for Haskell based on Gtk+."
url="http://hackage.haskell.org/package/${_hkgname}"
arch=('x86_64')
license=('LGPL-2.1')
makedepends=('ghc' 'haskell-gtk2hs-buildtools')
depends=('ghc-libs' 'haskell-mtl' 'haskell-text' 'haskell-glib' 'haskell-pango' 'haskell-cairo' 'gtk2')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('9c837342d3dd2977e65dd214cd94b35130792e193b7ad37e26fd327d4d7ec5e24fb7d42b346d1c090925cc8feabe25344384cc48f22c709ba320cb06b5376437')

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
