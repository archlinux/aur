# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=openhab3
pkgver=3.0.0.M4
pkgrel=1
pkgdesc="openhab3 open source home automation software"
arch=("any")
url="http://www.openhab.org/"
license=("EPL")
depends=("java-runtime-headless=11")

backup=("etc/${pkgname}/services/addons.cfg"
        "etc/${pkgname}/services/runtime.cfg"
        "etc/default/${pkgname}"
        "var/lib/${pkgname}/etc/keystore"
        "var/lib/${pkgname}/etc/users.properties"
        "var/lib/${pkgname}/etc/keys.properties")

source=("openhab-${pkgver}.tar.gz::https://openhab.jfrog.io/openhab/libs-milestone-local/org/openhab/distro/openhab/${pkgver}/openhab-${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.default"
        "${pkgname}.patch")

noextract=("openhab-${pkgver}.tar.gz")

sha256sums=('63b1725ab2e37ee25649663362fb08bedb6f9c1727c5511543eef2d8048d008c'
            '9b42de40f82dfe1fcb5efcac5f69d948e39f955e85c6273daddd97bc94ac34b6'
            'b149d976dc13dc18c62d2014457557e266e733ead70b0730d06dcd0372da78a7'
            '3f7478e5742ff504b3200b580eba84bd10f9adde24c0a5e070dda71125a69c3b')

prepare() {
    if [[ ! -d ${srcdir}/${pkgname} ]]; then
        mkdir ${srcdir}/${pkgname}
    fi
    cd ${srcdir}/${pkgname}
    tar xzf ${srcdir}/openhab-${pkgver}.tar.gz
    patch -p1 < ../${pkgname}.patch
}

package() {
    install -Dm644 ${pkgname}.default "${pkgdir}/etc/default/${pkgname}"
    install -Dm644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    mkdir -p "${pkgdir}/etc/${pkgname}"
    cp -r ${srcdir}/${pkgname}/conf/* "${pkgdir}/etc/${pkgname}"

    mkdir -p "${pkgdir}/var/lib/${pkgname}"
    cp -r ${srcdir}/${pkgname}/userdata/* "${pkgdir}/var/lib/${pkgname}"

    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/share"

    mkdir -p "${pkgdir}/var/log/${pkgname}"

    rm -fr "${pkgdir}/usr/share/${pkgname}/conf"
    rm -fr "${pkgdir}/usr/share/${pkgname}/userdata"

    echo "u ${pkgname} - - /usr/share/${pkgname}" | install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/sysusers.d/"${pkgname}".conf
    echo "Z /etc/${pkgname} - ${pkgname} ${pkgname} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    echo "Z /usr/share/${pkgname} - ${pkgname} ${pkgname} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    echo "Z /var/lib/${pkgname} - ${pkgname} ${pkgname} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    echo "z /var/log/${pkgname} - ${pkgname} ${pkgname} -" >> "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
