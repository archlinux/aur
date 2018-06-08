
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=haskell-gi
_hkgname=haskell-gi
pkgver=0.21.3
pkgrel=2
pkgdesc="Generate Haskell bindings for GObject Introspection capable libraries
"
url=https://hackage.haskell.org/package/haskell-gi
license=('BSD')
arch=('i686' 'x86_64')
depends=("ghc-libs" "gobject-introspection" 'haskell-base' 'haskell-safe' 'haskell-bytestring' 'haskell-mtl' 'haskell-regex-tdfa' "haskell-xdg-basedir" 'haskell-xml-conduit' 'haskell-semigroups' 'haskell-transformers' 'haskell-pretty-show' 'haskell-process' 'haskell-gi-base' 'haskell-directory')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('c0ae6687f2402742109c3c5dab03d17ca96dfce0680624ea595ee269deb75527')


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
