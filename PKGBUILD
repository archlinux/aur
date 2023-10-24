# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=apalache
pkgname=$_pkgname-bin
pkgver=0.44.0
pkgrel=1
pkgdesc="A symbolic model checker for TLA+"
arch=('any')
url="https://${_pkgname}.informal.systems/"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('java-runtime>=11'
         'findutils'
         'coreutils'
         'util-linux')
makedepends=('patch')
source=("https://github.com/informalsystems/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tgz"
        'sys-install.patch'
        'apalache.service')
sha256sums=('699c687f69db2eeaeddff1f6800cd8e2a22db164bd1a619391848d9f0ef23b8c'
            'c88201e1adeb5b50cfadfd55d071dedef8b3199cb1fcd5b5f008e5240be2f08d'
            '635ac8ddb7150d4d3437471cbdf5f72bf5e9d11a1039adec84e04c78ee1a39c9')

prepare() {
    patch --directory="${srcdir}/${_pkgname}-${pkgver}/bin" --forward --strip=1 --input="${srcdir}/sys-install.patch"
}

package() {
    install -Dt "${pkgdir}/usr/bin" "${_pkgname}-${pkgver}/bin/${_pkgname}-mc"
    install -Dt "${pkgdir}/usr/share/java/${_pkgname}" "${_pkgname}-${pkgver}/lib/${_pkgname}.jar"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}-${pkgver}/LICENSE"

    ln -s "/usr/bin/$_pkgname-mc" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$srcdir/apalache.service" "$pkgdir/usr/lib/systemd/system/apalache.service"
}
