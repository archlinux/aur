# Contributor: Leif Warner <abimelech@gmail.com>
_hkgname=http-reverse-proxy
pkgname=haskell-http-reverse-proxy
pkgver=0.6.2.0
pkgrel=1
pkgdesc="Reverse proxy HTTP requests, either over raw sockets or with WAI"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-blaze-builder' 'haskell-case-insensitive' 'haskell-conduit' 'haskell-conduit-extra' 'haskell-http-client' 'haskell-unliftio' 'haskell-wai' 'haskell-wai-logger' 'haskell-word8')
makedepends=('ghc')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
sha256sums=('15f92fe1fa244ab49c5e03cbb2e07219b3aeed05fc5fed09b0aa44f23db99290')
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
  install -D -m744 register.sh "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
  install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
  install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
  runhaskell Setup copy --destdir="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
