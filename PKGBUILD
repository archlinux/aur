
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=gtk-sni-tray
_hkgname=gtk-sni-tray
pkgver=0.1.5.0
pkgrel=1
pkgdesc="A standalone StatusNotifierItem/AppIndicator tray in haskell"
url=https://hackage.haskell.org/package/gtk-sni-tray
license=('BSD')
arch=('i686' 'x86_64')
depends=( 'haskell-base' 'ghc-libs' 'haskell-bytestring' 
'haskell-containers' 'haskell-gi-atk' 'haskell-gi-dbusmenugtk3' 
'haskell-gi-gdk' 'haskell-dbus' 'haskell-dbus-hslogger' 
'haskell-gtk-strut' 'haskell-cairo' 'haskell-gi-cairo' 'haskell-filepath'
'haskell-directory' 'haskell-enclosed-exceptions' 'haskell-hslogger'
'haskell-transformers-base' 'haskell-optparse-applicative' 'haskell-status-notifier-item'
'haskell-gi-gdkpixbuf' 'haskell-gi-glib' 'haskell-gi-gobject' 
'haskell-gi-gtk' 'haskell-gi' 'haskell-gi-base' 
'haskell-gi-overloading' 'haskell-text' 'haskell-transformers' 'libdbusmenu-gtk3')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('a0a79c780852c99fabc756df65a199fdf4dd70ddaee33d4f1c2a5406ffd4dd6d')


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
