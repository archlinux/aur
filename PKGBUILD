# Maintainer: Andy B. <brofi.archlinux at gmail dot com>

pkgname=haskell-alsa-core
_hkgname=alsa-core
pkgver=0.5.0.1
pkgrel=2
pkgdesc="Provides access to ALSA infrastructure"
url=https://hackage.haskell.org/package/alsa-core
license=('BSD')
arch=('i686' 'x86_64')
depends=('ghc=8.0.1' 'haskell-base' 'haskell-extensible-exceptions')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('eb50495ef05ecc7c06a0147da7f0d3efde832a44d23caaf5172dc114882270ab')
install="${pkgname}.install"
options=('staticlibs')

build() {
    cd ${_hkgname}-${pkgver}

    runhaskell Setup configure -O -p --enable-library-profiling --enable-shared \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${_hkgname}-${pkgver}
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/${pkgname}/register.sh"
    install    -m744 unregister.sh "${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

