# Maintainer: Leif Warner <abimelech@gmail.com>
_hkgname=http-reverse-proxy
pkgname=haskell-http-reverse-proxy
pkgver=0.4.3
pkgrel=1
pkgdesc="Reverse proxy HTTP requests, either over raw sockets or with WAI"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc' 'haskell-async' 'haskell-blaze-builder>=0.3' 'haskell-bytestring' 'haskell-case-insensitive>=0.4' 'haskell-conduit>=1.1' 'haskell-conduit-extra' 'haskell-containers' 'haskell-data-default-class' 'haskell-http-client>=0.3' 'haskell-http-types>=0.6' 'haskell-lifted-base>=0.1' 'haskell-monad-control>=0.3' 'haskell-network' 'haskell-resourcet' 'haskell-streaming-commons' 'haskell-text' 'haskell-transformers' 'haskell-wai>=3.0' 'haskell-wai-logger' 'haskell-word8>=0.0')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('6b591e99ac61f29de4ed9544f68e9211')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
