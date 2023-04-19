# Maintainer: Ben Alex <ben.alex@acegi.com.au>
pkgname=openhab3
pkgver=3.4.3
pkgrel=1
pkgdesc="openhab3 open source home automation software"
arch=("any")
url="http://www.openhab.org/"
license=("EPL")
depends=("java-runtime-headless=11" "archlinux-java-run")
optdepends=("openhab3-addons: add-on archives for offline use")

conflicts=("openhab3-snapshot")

backup=("etc/${pkgname}/services/addons.cfg"
        "etc/${pkgname}/services/runtime.cfg"
        "etc/default/${pkgname}"
        "var/lib/${pkgname}/etc/keystore"
        "var/lib/${pkgname}/etc/users.properties"
        "var/lib/${pkgname}/etc/keys.properties")
install="${pkgname}.install"

source=("openhab-${pkgver}.tar.gz::https://openhab.jfrog.io/artifactory/libs-release/org/openhab/distro/openhab/${pkgver}/openhab-${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.default"
        "${pkgname}.patch"
        "karaf_wrapper.sh"
        "${pkgname}.hook")
sha256sums=('b665c5d4e6f0f33829579cd7cbcfec03b41b8e55e620e58d3dd041fa6c4e5d57'
            '995bb5eacc583c22fe97555fd67e69911a63cfb02449a046481b5a0e64f4032c'
            'b149d976dc13dc18c62d2014457557e266e733ead70b0730d06dcd0372da78a7'
            '3f7478e5742ff504b3200b580eba84bd10f9adde24c0a5e070dda71125a69c3b'
            '9f5185d7f301d7abf5bd362710c89af43fb8391e13010226d43677ba2fc79762'
            '119c1e670eec082012778d53ff2b3e446036139fd7d7c5dd5b731cd576b1100a')


prepare() {
    patch -p1 < ${srcdir}/${pkgname}.patch
}

package() {
    install -Dm644 "${srcdir}/${pkgname}.default" "${pkgdir}/etc/default/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    mkdir -p "${pkgdir}/etc/${pkgname}"
    cp -r ${srcdir}/conf/* "${pkgdir}/etc/${pkgname}"

    mkdir -p "${pkgdir}/var/lib/${pkgname}/etc"
    cp -r ${srcdir}/userdata/etc/* "${pkgdir}/var/lib/${pkgname}/etc"

    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -r "${srcdir}/runtime" "${pkgdir}/usr/share/${pkgname}"
    cp -r "${srcdir}/addons" "${pkgdir}/usr/share/${pkgname}"
    install -m755 "${srcdir}/karaf_wrapper.sh" "${pkgdir}/usr/share/${pkgname}/karaf_wrapper.sh"

    mkdir -p "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"

    mkdir -p "${pkgdir}/var/log/${pkgname}"

    echo "u ${pkgname} - - /usr/share/${pkgname}" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    echo "m ${pkgname} uucp" >>  "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    echo "Z /etc/${pkgname} - ${pkgname} ${pkgname} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    echo "Z /usr/share/${pkgname} - ${pkgname} ${pkgname} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    echo "Z /var/lib/${pkgname} - ${pkgname} ${pkgname} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    echo "z /var/log/${pkgname} - ${pkgname} ${pkgname} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    echo "z /run/lock 0775 root uucp -" >> "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
