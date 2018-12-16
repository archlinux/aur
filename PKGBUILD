
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=haskell-status-notifier-item
_hkgname=status-notifier-item
pkgver=0.3.0.0
pkgrel=2
pkgdesc="A wrapper over the StatusNotifierItem/libappindicator dbus specification"
url=https://hackage.haskell.org/package/status-notifier-item
license=('BSD')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-base' 'haskell-hslogger' 'haskell-spool' 'haskell-dbus-hslogger' 'haskell-dbus' 'haskell-optparse-applicative')
makedepends=('ghc')
source=(
  "https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
  79f548c9fb77c1df2681be53bcf06b0f4b9c16ec.patch
)
sha256sums=('7b2702eb7eebe8d3499d6ecf8c6cfa81e9b41828fd837615b285102389e75ba3'
            'af05bca399854f45553bb2ca000b4003c7dcaefd5586009a0e93f10efc3f24c3')

prepare() {
  cd $_hkgname-$pkgver
  # Patch for building against dbus-1.2.1
  # See https://github.com/IvanMalison/status-notifier-item/pull/3
  patch -Np1 -i "${srcdir}/79f548c9fb77c1df2681be53bcf06b0f4b9c16ec.patch"
  sed -i '55i\    , text' status-notifier-item.cabal
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
