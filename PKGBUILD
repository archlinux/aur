# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=apalache
_prjname=$_pkgname-mc
pkgname=$_pkgname-bin
pkgver=0.62.2
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
install=$_pkgname.install
source=("https://github.com/${_prjname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tgz"
        'apalache.service')
sha256sums=('765f610537281a0f25b8c30f2554f19523e2859c824e80e62276653ee23c10e2'
            'ca75ed24e2683e8820bc1482c7d6afc4d146d1c500abc03f2f45035e883a151c')

prepare() {
    local launcher="${srcdir}/${_pkgname}-${pkgver}/bin/${_pkgname}-mc"

    sed -i \
        's|^APALACHE_JAR=.*$|APALACHE_JAR=${APALACHE_JAR:-"/usr/share/java/apalache/apalache.jar"}|' \
        "$launcher"

    grep -qxF \
        'APALACHE_JAR=${APALACHE_JAR:-"/usr/share/java/apalache/apalache.jar"}' \
        "$launcher"
}

package() {
    install -Dt "${pkgdir}/usr/bin" "${_pkgname}-${pkgver}/bin/${_pkgname}-mc"
    install -Dt "${pkgdir}/usr/share/java/${_pkgname}" "${_pkgname}-${pkgver}/lib/${_pkgname}.jar"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}-${pkgver}/LICENSE"

    ln -s "/usr/bin/$_pkgname-mc" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$srcdir/apalache.service" "$pkgdir/usr/lib/systemd/system/apalache.service"
}
