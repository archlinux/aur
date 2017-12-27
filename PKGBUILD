# $Id$
# Maintainer: Emanuel Couto <unit73e at gmail dot com>

_hkgname=vulkan
pkgname=haskell-vulkan
pkgver=1.7.0.0
pkgrel=1
pkgdesc="Haskell bindings to the Vulkan graphics API"
url="http://github.com/expipiplus1/vulkan#readme"
license=('custom:BSD3')
arch=('x86_64')
depends=('ghc-libs' 'haskell-vector-sized')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "update-vector-sized.patch" "add-scoped-typed-variables.patch")
sha256sums=('17c8437061adee81f6c4b34a1ead85a44f98c0c443bc2696025f1849c086e965'
            '09f891c690508b0f74973ee9eec471ac397665f07d74fd87c94dd68e72b8d6e9'
            'df9e615b9827a5762ea299a5618fc2c2b4787ea468b32039b076f41e7eea4e2d')

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    patch -Np2 -i "${srcdir}/update-vector-sized.patch"
    patch -Np2 -i "${srcdir}/add-scoped-typed-variables.patch"
}

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
