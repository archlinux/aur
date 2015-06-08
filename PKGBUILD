# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=haskell-configurator
_hkgname=configurator
_licensefile=LICENSE
pkgver=0.3.0.0
pkgrel=2
pkgdesc="A configuration management library for programs and daemons."
url="http://hackage.haskell.org/package/configurator"
license=('BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=('haskell-attoparsec'
         'haskell-bytestring'
         'haskell-directory'
         'haskell-hashable'
         'haskell-text'
         'haskell-unix-compat'
         'haskell-unordered-containers')
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
md5sums=('aac63c54d79daed3f5d854ee9d34a6ef')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}

    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
        --prefix=/usr --docdir=/usr/share/doc/${pkgname} \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
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
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
