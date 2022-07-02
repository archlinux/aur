# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_pkgbase=openhab3
pkgname=${_pkgbase}-snapshot
pkgver=3.4.0
pkgrel=2
pkgdesc="openhab3 open source home automation software"
arch=("any")
url="http://www.openhab.org/"
license=("EPL")
depends=("java-runtime-headless=11" "archlinux-java-run")
optdepends=("openhab3-snapshot-addons: add-on archives for offline use")

conflicts=("openhab3")

backup=("etc/${_pkgbase}/services/addons.cfg"
        "etc/${_pkgbase}/services/runtime.cfg"
        "etc/default/${_pkgbase}"
        "var/lib/${_pkgbase}/etc/keystore"
        "var/lib/${_pkgbase}/etc/users.properties"
        "var/lib/${_pkgbase}/etc/keys.properties")

install="${_pkgbase}.install"

source=("openhab-${pkgver}-SNAPSHOT.tar.gz::https://ci.openhab.org/job/openHAB3-Distribution/lastSuccessfulBuild/artifact/distributions/openhab/target/openhab-${pkgver}-SNAPSHOT.tar.gz"
        "${_pkgbase}.service"
        "${_pkgbase}.default"
        "${_pkgbase}.patch"
        "karaf_wrapper.sh"
        "${_pkgbase}.hook")

sha256sums=('SKIP'
            '995bb5eacc583c22fe97555fd67e69911a63cfb02449a046481b5a0e64f4032c'
            'b149d976dc13dc18c62d2014457557e266e733ead70b0730d06dcd0372da78a7'
            '3f7478e5742ff504b3200b580eba84bd10f9adde24c0a5e070dda71125a69c3b'
            '9f5185d7f301d7abf5bd362710c89af43fb8391e13010226d43677ba2fc79762'
            'f767e7a6a3442bb672105a30aa1a711ea893286b2ade347db70939f00a644ebf')

prepare() {
    patch -p1 < ${srcdir}/${_pkgbase}.patch
}

package() {
    install -Dm644 "${srcdir}/${_pkgbase}.default" "${pkgdir}/etc/default/${_pkgbase}"
    install -Dm644 "${srcdir}/${_pkgbase}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgbase}.service"

    mkdir -p "${pkgdir}/etc/${_pkgbase}"
    cp -r ${srcdir}/conf/* "${pkgdir}/etc/${_pkgbase}"

    mkdir -p "${pkgdir}/var/lib/${_pkgbase}/etc"
    cp -r ${srcdir}/userdata/etc/* "${pkgdir}/var/lib/${_pkgbase}/etc"

    mkdir -p "${pkgdir}/usr/share/${_pkgbase}"
    cp -r "${srcdir}/runtime" "${pkgdir}/usr/share/${_pkgbase}"
    cp -r "${srcdir}/addons" "${pkgdir}/usr/share/${_pkgbase}"
    install -m755 "${srcdir}/karaf_wrapper.sh" "${pkgdir}/usr/share/${_pkgbase}/karaf_wrapper.sh"

    mkdir -p "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/${_pkgbase}.hook" "${pkgdir}/usr/share/libalpm/hooks/${_pkgbase}.hook"

    mkdir -p "${pkgdir}/var/log/${_pkgbase}"

    echo "u ${_pkgbase} - - /usr/share/${_pkgbase}" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
    echo "m ${pkgname} uucp" >>  "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    echo "Z /etc/${_pkgbase} - ${_pkgbase} ${_pkgbase} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
    echo "Z /usr/share/${_pkgbase} - ${_pkgbase} ${_pkgbase} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
    echo "Z /var/lib/${_pkgbase} - ${_pkgbase} ${_pkgbase} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
    echo "z /var/log/${_pkgbase} - ${_pkgbase} ${_pkgbase} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
    echo "z /run/lock 0775 root uucp -" >> "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
