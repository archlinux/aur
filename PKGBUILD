# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='omada-controller'
pkgver=3.2.6
pkgrel=2
pkgdesc='Centralized EAP controller software'
arch=('x86_64')
url='https://www.tp-link.com/support/download/eap-controller/#Controller_Software'
license=('custom')
depends=('jre8-openjdk' 'java-jsvc' 'net-tools')
provides=('eap-controller')
source=(
    "https://static.tp-link.com/2020/202001/20200116/Omada_Controller_v${pkgver}_linux_x64.tar.gz"
    "${pkgname}.conf"
    "${pkgname}.hook"
    "${pkgname}.service"
)
sha256sums=(
    'bf1fda3e1d882fa15bf8909cb4f2ede5561e5e47d7b02e422524136781aa8b12'
    '529a29bf0caf410380b27a180460078195c3cdb3dfd8df48ac1003538144f353'
    'b7cccd06087df2e52815ea3f00b2edf7ab302e362d78edaa61222321fdb41726'
    '7f75a06130d20011445b9d4e9ca785ad12f8b7b4cbbfba226299a202b2ff266c'
)


package() {
    # Install required source files.
    cd "${srcdir}/Omada_Controller_v3.2.6_linux_x64"
    local BASEDIR="${pkgdir}/var/lib/omada-controller"
    install -dm 755 "${BASEDIR}"

    for dir in data keystore lib properties webapps; do
        cp -a "${dir}" "${BASEDIR}/"
    done

    # Install custom MongoDB binary.
    install -Dm 755 bin/mongod "${BASEDIR}/bin/mongod"

    # Install systemd units.
    install -d -m 755 ${pkgdir}/usr/lib/systemd/system
    install -m 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/"

    # Install sysusers configuration.
    install -d -m 755 "${pkgdir}/usr/lib/sysusers.d"
    install -m 644 "${srcdir}/${pkgname}.conf" "${pkgdir}/usr/lib/sysusers.d/"

    # Install ALPM hooks.
    install -d -m 755 "${pkgdir}/usr/share/libalpm/hooks"
    install -m 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/zz-${pkgname}.hook"
}
