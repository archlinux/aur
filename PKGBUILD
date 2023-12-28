# Maintainer: Ben Alex <ben.alex@acegi.com.au>
pkgname=openhab4
pkgver=4.1.0
pkgrel=1
pkgdesc="openhab4 open source home automation software"
arch=("any")
 url="http://www.openhab.org/"
license=("EPL")
depends=("java-runtime-headless=17" "archlinux-java-run")
optdepends=("openhab4-addons: add-on archives for offline use")

conflicts=("openhab4-snapshot")

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
sha256sums=('aa75eb31b10a7d966f006b6358e8d5db1304e2a7912decddf3a09b3cdec615dc'
            'b339bb5d1ddea2307170941033f1ace0de5bb82cdb0f4494ee00e9f9724aec85'
            'a1df4e6fa274e23328e40f07f1f71f51150eb303045e3b53db60932e926c5b81'
            'cf89b80d32f91c382d62c9aa9c5a033fe80bb79d453fbdd49f97cf1412468ff7'
            'b19c995beb521af7bf7a882370396748063a5bda9fdf2f28ed36e98437e98555'
            '602b17bf8b824df289dbd5e5eea824042b3ec38de58c76b69b4dc72d90adfe35')


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
