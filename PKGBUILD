
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=haskell-gi
_hkgname=haskell-gi
pkgver=0.23.0
pkgrel=1
epoch=1
pkgdesc="Generate Haskell bindings for GObject Introspection capable libraries
"
url=https://hackage.haskell.org/package/haskell-gi
license=('BSD')
arch=('i686' 'x86_64')
depends=("ghc-libs" "gobject-introspection" 'haskell-base' 'haskell-safe' 'haskell-bytestring' 'haskell-mtl' 'haskell-regex-tdfa' "haskell-xdg-basedir" 'haskell-xml-conduit' 'haskell-transformers' 'haskell-pretty-show' 'haskell-process' 'haskell-gi-base' 'haskell-directory')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
         )
sha256sums=('8ad81ef082c71f41c6c6e0afbd8779497da6ffb1e9e7c2b207efe0b56aa7a211')

prepare() {
  cd "${srcdir}/${_hkgname}-${pkgver}"
  
}
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
