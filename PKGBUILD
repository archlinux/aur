# Maintainer: Leif Warner <abimelech@gmail.com>
_hkgname=wai-app-static
pkgname=haskell-wai-app-static
pkgver=3.1.0
pkgrel=1
pkgdesc="WAI application for static serving"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:MIT')
arch=('i686' 'x86_64')
depends=('haskell-base64-bytestring>=0.1' 'haskell-blaze-builder>=0.2.1.4' 'haskell-blaze-html>=0.5' 'haskell-blaze-markup>=0.5.1' 'haskell-byteable' 'haskell-bytestring' 'haskell-containers' 'haskell-cryptohash-conduit' 'haskell-cryptohash>=0.11' 'haskell-directory' 'haskell-file-embed>=0.0.3.1' 'haskell-http-date' 'haskell-http-types>=0.7' 'haskell-mime-types<0.2' 'haskell-old-locale' 'haskell-system-fileio>=0.3' 'haskell-filepath' 'haskell-template-haskell' 'haskell-text' 'haskell-time' 'haskell-transformers' 'haskell-unix-compat>=0.2' 'haskell-unordered-containers>=0.2' 'haskell-wai' 'haskell-wai-extra' 'haskell-warp' 'haskell-optparse-applicative' 'haskell-zlib')
options=('staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('950ec3abafa151c979fba2840faeea86')
install=${pkgname}.install
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
