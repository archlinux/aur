
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=haskell-gi-gtk-hs
_hkgname=gi-gtk-hs
pkgver=0.3.8.0
pkgrel=1
pkgdesc="A wrapper for gi-gtk, adding a few more idiomatic API parts on top"
url=https://hackage.haskell.org/package/gi-gtk-hs
license=('LGPL-2.1')
arch=('i686' 'x86_64')
depends=('haskell-base' 'haskell-base-compat' 'ghc-libs' 
'haskell-containers' 'haskell-gi-gtk' 'haskell-mtl' 
'haskell-gi-gdk' 'haskell-gi-gdkpixbuf' 
'haskell-gi-glib' 'haskell-gi-gobject' 
'haskell-gi-base' 'haskell-text' 'haskell-transformers')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('b4c4fc2936a24be471243460f4b3359096ddc989d84018566ff14a47049efe32')


build() {
	cd "${srcdir}/${_hkgname}-${pkgver}"
	runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" --datasubdir="$pkgname" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${_hkgname}-${pkgver}
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
