# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_pkgbase=openhab3
pkgname=${_pkgbase}-snapshot
pkgver=3.0.0
pkgrel=1
pkgdesc="openhab3 open source home automation software"
arch=("any")
url="http://www.openhab.org/"
license=("EPL")
depends=("java-runtime-headless=11" "archlinux-java-run")

conflicts=("openhab3")

backup=("etc/${_pkgbase}/services/addons.cfg"
        "etc/${_pkgbase}/services/runtime.cfg"
        "etc/default/${_pkgbase}"
        "var/lib/${_pkgbase}/etc/keystore"
        "var/lib/${_pkgbase}/etc/users.properties"
        "var/lib/${_pkgbase}/etc/keys.properties")

source=("openhab-${pkgver}-SNAPSHOT.tar.gz::https://ci.openhab.org/job/openHAB3-Distribution/lastSuccessfulBuild/artifact/distributions/openhab/target/openhab-${pkgver}-SNAPSHOT.tar.gz"
        "${_pkgbase}.service"
        "${_pkgbase}.default"
        "${_pkgbase}.patch")

sha256sums=('SKIP'
            'e4b374cf5d590e8a91a43ab5cc8be9d82f6ebff22c3ce0ee767dc13ffc1ebe1d'
            'b149d976dc13dc18c62d2014457557e266e733ead70b0730d06dcd0372da78a7'
            '3f7478e5742ff504b3200b580eba84bd10f9adde24c0a5e070dda71125a69c3b')

prepare() {
    patch -p1 < ../${_pkgbase}.patch
}

package() {
    install -Dm644 ${_pkgbase}.default "${pkgdir}/etc/default/${_pkgbase}"
    install -Dm644 ${_pkgbase}.service "${pkgdir}/usr/lib/systemd/system/${_pkgbase}.service"

    mkdir -p "${pkgdir}/etc/${_pkgbase}"
    cp -r ${srcdir}/conf/* "${pkgdir}/etc/${_pkgbase}"

    mkdir -p "${pkgdir}/var/lib/${_pkgbase}"
    cp -r ${srcdir}/userdata/* "${pkgdir}/var/lib/${_pkgbase}"

    mkdir -p "${pkgdir}/usr/share/${_pkgbase}"
    cp -r "${srcdir}/runtime" "${pkgdir}/usr/share/${_pkgbase}"
    cp -r "${srcdir}/addons" "${pkgdir}/usr/share/${_pkgbase}"

    mkdir -p "${pkgdir}/var/log/${_pkgbase}"

    echo "u ${_pkgbase} - - /usr/share/${_pkgbase}" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
    echo "Z /etc/${_pkgbase} - ${_pkgbase} ${_pkgbase} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
    echo "Z /usr/share/${_pkgbase} - ${_pkgbase} ${_pkgbase} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
    echo "Z /var/lib/${_pkgbase} - ${_pkgbase} ${_pkgbase} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
    echo "z /var/log/${_pkgbase} - ${_pkgbase} ${_pkgbase} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
}
