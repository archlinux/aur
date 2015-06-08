# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Nicola Squartini <tensor5@gmail.com>

_hkgname=happstack-server
pkgname=haskell-happstack-server
pkgver=7.4.1
pkgrel=3
pkgdesc="Web related tools and services."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-base64-bytestring>=1.0' 'haskell-blaze-html>=0.5'
         'haskell-bytestring' 'haskell-containers' 'haskell-directory' 'haskell-exceptions' 'haskell-extensible-exceptions'
         'haskell-filepath' 'haskell-hslogger>=1.0.2' 'haskell-html' 'haskell-monad-control>=0.3'
         'haskell-mtl>=2.0' 'haskell-network>=2.2.3' 'haskell-network-uri' 'haskell-old-locale' 'haskell-parsec<4' 'haskell-process'
         'haskell-sendfile>=0.7.1' 'haskell-syb' 'haskell-system-filepath>=0.3.1' 'haskell-template-haskell' 'haskell-text>=0.10'
         'haskell-text<0.12' 'haskell-threads>=0.5' 'haskell-time' 'haskell-time-compat' 'haskell-transformers>=0.1.3'
         'haskell-transformers-base<0.5' 'haskell-transformers-compat' 'haskell-unix' 'haskell-utf8-string>=0.3.4'
         'haskell-xhtml' 'haskell-zlib')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('5b3ceda986b072cc4a8abb9c0f521842')
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
    install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
