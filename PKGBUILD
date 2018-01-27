# Maintainer: Leif Warner <abimelech@gmail.com>

# custom variables
_hkgname=dyre

# PKGBUILD options/directives
pkgname=haskell-dyre
pkgver=0.8.12
pkgrel=1
pkgdesc="Dynamic reconfiguration in Haskell"
url="http://github.com/willdonnelly/dyre"
LICENSE
arch=('i686' 'x86_64')
depends=("ghc"
         "haskell-executable-path"
         "haskell-ghc-paths"
         "haskell-io-storage"
         "haskell-xdg-basedir")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("e224305cc6b38b4143f49489931c2ea94b326915206d34eddf5b2ee2b5a71682")

# PKGBUILD functions

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-shared --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -Dm 744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -Dm 744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
