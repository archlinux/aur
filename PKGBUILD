# Maintainer: Leif Warner <abimelech@gmail.com>
_hkgname=idris
pkgname=idris
pkgver=0.9.19
pkgrel=1
pkgdesc="Functional Programming Language with Dependent Types"
url="http://www.idris-lang.org/"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedpends=('ghc' 'haskell-annotated-wl-pprint>=0.7'  'haskell-annotated-wl-pprint<0.8' 'haskell-ansi-terminal<0.7' 'haskell-ansi-wl-pprint<0.7' 'haskell-base64-bytestring<1.1' 'haskell-binary<0.8' 'haskell-blaze-html<0.8' 'haskell-blaze-markup<0.6.3.0' 'haskell-bytestring' 'haskell-cheapskate<0.2' 'haskell-containers' 'haskell-deepseq' 'haskell-directory' 'haskell-filepath' 'haskell-fingertree<0.2' 'haskell-haskeline<0.8' 'haskell-mtl' 'haskell-network' 'haskell-optparse-applicative<0.12' 'haskell-parsers<0.13' 'haskell-pretty' 'haskell-process' 'haskell-safe' 'haskell-split<0.3' 'haskell-text' 'haskell-time' 'haskell-transformers' 'haskell-transformers-compat>=0.3' 'haskell-trifecta<1.6' 'haskell-uniplate<1.7' 'haskell-unix' 'haskell-unordered-containers<0.3' 'haskell-utf8-string<0.4' 'haskell-vector<0.11' 'haskell-vector-binary-instances<0.3' 'haskell-zip-archive<0.2.4' 'haskell-zlib' 'haskell-libffi')
depends=('gmp' 'libffi' 'zlib' 'gcc')
options=('staticlibs')
provides=('idris')
conflicts=('idris-git')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('499c76ae4cea217c5befa45f7d68ca15')
install=${pkgname}.install
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid -fFFI -fGMP
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
