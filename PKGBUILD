# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=openhab3
pkgver=3.0.0.RC2
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

source=("openhab-${pkgver}.tar.gz::https://openhab.jfrog.io/openhab/libs-milestone-local/org/openhab/distro/openhab/${pkgver}/openhab-${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.default"
        "${pkgname}.patch"
        "karaf_wrapper.sh")

sha256sums=('a76e0dd350be2ee13785cc37f4b755e7a6a4f2f58c3f6015ce2d4e50407e6cdd'
            '995bb5eacc583c22fe97555fd67e69911a63cfb02449a046481b5a0e64f4032c'
            'b149d976dc13dc18c62d2014457557e266e733ead70b0730d06dcd0372da78a7'
            '3f7478e5742ff504b3200b580eba84bd10f9adde24c0a5e070dda71125a69c3b'
            '9f5185d7f301d7abf5bd362710c89af43fb8391e13010226d43677ba2fc79762')

prepare() {
    patch -p1 < ../${pkgname}.patch
}

package() {
    install -Dm644 "${srcdir}/${pkgname}.default" "${pkgdir}/etc/default/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    mkdir -p "${pkgdir}/etc/${pkgname}"
    cp -r ${srcdir}/conf/* "${pkgdir}/etc/${pkgname}"

    mkdir -p "${pkgdir}/var/lib/${pkgname}"
    cp -r ${srcdir}/userdata/* "${pkgdir}/var/lib/${pkgname}"

    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -r "${srcdir}/runtime" "${pkgdir}/usr/share/${pkgname}"
    cp -r "${srcdir}/addons" "${pkgdir}/usr/share/${pkgname}"
    install -m755 "${srcdir}/karaf_wrapper.sh" "${pkgdir}/usr/share/${pkgname}/karaf_wrapper.sh"

    mkdir -p "${pkgdir}/var/log/${pkgname}"

    echo "u ${pkgname} - - /usr/share/${pkgname}" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    echo "Z /etc/${pkgname} - ${pkgname} ${pkgname} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    echo "Z /usr/share/${pkgname} - ${pkgname} ${pkgname} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    echo "Z /var/lib/${pkgname} - ${pkgname} ${pkgname} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    echo "z /var/log/${pkgname} - ${pkgname} ${pkgname} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
