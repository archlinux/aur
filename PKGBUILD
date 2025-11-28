# Maintainer: Ben Alex <ben.alex@acegi.com.au>
pkgname=openhab5
pkgver=5.0.3
pkgrel=1
pkgdesc="openhab5 open source home automation software"
arch=("any")
 url="http://www.openhab.org/"
license=("EPL")
depends=("java-runtime-headless=21" "archlinux-java-run")
optdepends=("openhab5-addons: add-on archives for offline use")

conflicts=("openhab5-snapshot")

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
sha256sums=('c75157d4a412f6fdc28924dee562244e728ea2c51b75a86c362f1c5adc62fcf1'
            '0150dd2a2708b2229e7ad7e980a516b7259fd2f06300cd2de0a7aeced381ca0b'
            'a12ac4b13481c9eb8c7472650f8231a8ff99ecc589302a62b59e819680b10fed'
            '40f9769e7c9b43abcb9705a3762bf11bfa0b6906601dd09b68a9585452a9608b'
            'a8cc033707678380239d670cfbeb3f3450314b113e9b9e6dbb7bec41ff42f0a1'
            '3cb4e82e5aa71861024bef768c2a82d3cf3ec2423d6eb71b9ef9649ec15b6994')

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
