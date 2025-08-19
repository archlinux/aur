# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=apalache
_prjname=$_pkgname-mc
pkgname=$_pkgname-bin
pkgver=0.48.0
pkgrel=1
pkgdesc="A symbolic model checker for TLA+"
arch=('any')
url="https://${_prjname}.org"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('java-runtime>=11'
         'findutils'
         'coreutils'
         'util-linux')
makedepends=('patch')
source=("https://github.com/${_prjname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tgz"
        'sys-install.patch'
        'apalache.service')
sha256sums=('f92ac87d6e23a5f964608605fe7256b80efeb90a2257ed31a0ad98b9c4178a0f'
            '336d6c70ce596c7f87a3aefb3a20836fea35caec36225fb65a56f8780a6b5bee'
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
