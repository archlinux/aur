# Maintainer: wenLiangcan <boxeed at gmail dot com>

_hkgname=jinglib
_pkgname=haskell-jinglib
pkgname=haskell-jinglib-git
pkgver=20130824
pkgrel=1
pkgdesc="jing.fm wrapper in Haskell"
url="https://github.com/rnons/jinkell"
license=('Unkown')
arch=('i686' 'x86_64')
makedepends=('git')
depends=('ghc' 'haskell-http' 'haskell-aeson>=0.6' 'haskell-bytestring>=0.9.1.10' 'haskell-containers>=0.4.0.0' 'haskell-mtl' 'haskell-network>=2.3.0.2' 'haskell-text>=0.11.0.5')
provides=("${_pkgname}"=2013.3)
options=('strip' 'staticlibs')
source=("${_hkgname}"::'git://github.com/rnons/jinkell.git')
install=${_pkgname}.install
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_hkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "${srcdir}/${_hkgname}/${_hkgname}"
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
        --prefix=/usr --docdir=/usr/share/doc/${_pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}/${_hkgname}"
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/${_pkgname}/register.sh"
    install    -m744 unregister.sh "${pkgdir}/usr/share/haskell/${_pkgname}/unregister.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s "/usr/share/doc/${_pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir=${pkgdir}
}
