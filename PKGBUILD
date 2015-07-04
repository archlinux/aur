# Maintainer: Leif Warner <abimelech@gmail.com>
_hkgname=trifecta
pkgname=haskell-trifecta
pkgver=1.5.1.3
pkgrel=1
pkgdesc="A modern parser combinator library with convenient diagnostics"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc' 'haskell-ansi-terminal<0.7' 'haskell-ansi-wl-pprint<0.7' 'haskell-array' 'haskell-blaze-builder<0.5' 'haskell-blaze-html<0.9' 'haskell-blaze-markup<0.8' 'haskell-bytestring' 'haskell-charset<1' 'haskell-comonad<5' 'haskell-containers' 'haskell-deepseq' 'haskell-fingertree<0.2' 'haskell-hashable<1.3' 'haskell-lens<5' 'haskell-mtl' 'haskell-parsers<1' 'haskell-reducers<4' 'haskell-semigroups<1' 'haskell-transformers' 'haskell-unordered-containers<0.3' 'haskell-utf8-string<1.1')
options=('staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz
        '0001-Version-bumps.patch')
md5sums=('e50446834273ea993e729fffd76a66db'
         '91354d611dcb9378369b39cb17d5a8ab')
install=${pkgname}.install
prepare() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    # Will be in next release: https://github.com/ekmett/trifecta/pull/44
    patch -p1 < ${srcdir}/0001-Version-bumps.patch
}
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
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/INSTALL
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
