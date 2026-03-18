# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=apalache
_prjname=$_pkgname-mc
pkgname=$_pkgname-bin
pkgver=0.54.0
pkgrel=1
pkgdesc="A symbolic model checker for TLA+"
arch=('any')
url="https://${_prjname}.org"
license=('Apache-2.0')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('java-runtime>=17'
         'findutils'
         'coreutils'
         'util-linux')
makedepends=('patch')
install=$_pkgname.install
source=("https://github.com/${_prjname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tgz"
        'sys-install.patch'
        'apalache.service')
sha256sums=('cd43472a1e391af33027bd452dc825ab521cfec877ee67291dc72909150112e3'
            'c694360265a24c3099e628079733bb442ee225393dc9b3dcc5c14a43081e3ca4'
            'ca75ed24e2683e8820bc1482c7d6afc4d146d1c500abc03f2f45035e883a151c')

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
