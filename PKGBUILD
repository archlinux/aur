# Contributor: Konstantinos Foutzopoulos <mail@konfou.xyz>
# Contributor: Colin Woodbury <colingw@gmail.com>

_hkgname=regex-pcre-builtin
pkgname=haskell-regex-pcre-builtin
pkgver=0.95.2.3.8.44
pkgrel=1
pkgdesc="The PCRE backend to accompany regex-base, with bundled code"
url="https://hackage.haskell.org/package/regex-pcre-builtin"
license=("custom:BSD3")
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-regex-base')
makedepends=('ghc')
options=('strip' 'staticlibs')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('cacea6a45faf93df8afbf50ecb09f87acabfed0477cba4746205649eb52ec55e')

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

# vim:set ts=2 sw=2 et:
