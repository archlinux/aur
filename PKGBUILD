# Maintainer: Chan Beom Park <cbpark@gmail.com>

_hkgname=gtk
pkgname=haskell-gtk2
pkgver=0.14.6
pkgrel=1
pkgdesc="The core library of the Gtk2Hs suite of libraries for Haskell based on Gtk+."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('LGPL-2.1')
arch=('i686' 'x86_64')
makedepends=('haskell-gtk2hs-buildtools>=0.13.2.0')
depends=('ghc>=8.0.1'
         'haskell-mtl'
         'haskell-text>=0.11.0.6'
         'haskell-glib>=0.13.0.0'
         'haskell-pango>=0.13.0.0'
         'haskell-cairo>=0.13.0.0'
         'gtk2')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('707906120cb8f0aa704fb2045a33600b7636166d74442a9c27c4262bac708327')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    runhaskell Setup configure -O --enable-library-profiling --enable-shared \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock --hoogle --html
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"

    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s "/usr/share/doc/${pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
