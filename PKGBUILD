# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Co-Maintainer: Stick <stick at stma dot is>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>
# Contributor: Zdenek Obst <zdenek dot obst at gmail dot com>
pkgname=wildfly
pkgver=27.0.1
pkgrel=1
pkgdesc='Wildfly Application Server.'
url='http://www.wildfly.org/'
license=('LGPL')
arch=('any')
depends=('java-runtime>=11')
optdepends=('libaio: ActiveMQ Artemis'
            'lib32-glibc: native OpenSSL support')
conflicts=("${pkgname}-devel")
_pkgloc=opt
_cfgloc=etc
_sysdloc=usr/lib/systemd/system
backup=("${_pkgloc}/${pkgname}/domain/configuration/application-roles.properties"
        "${_pkgloc}/${pkgname}/domain/configuration/application-users.properties"
        "${_pkgloc}/${pkgname}/domain/configuration/logging.properties"
        "${_pkgloc}/${pkgname}/domain/configuration/mgmt-groups.properties"
        "${_pkgloc}/${pkgname}/domain/configuration/mgmt-users.properties"
        "${_pkgloc}/${pkgname}/domain/configuration/domain.xml"
        "${_pkgloc}/${pkgname}/domain/configuration/host.xml"
        "${_pkgloc}/${pkgname}/standalone/configuration/application-roles.properties"
        "${_pkgloc}/${pkgname}/standalone/configuration/application-users.properties"
        "${_pkgloc}/${pkgname}/standalone/configuration/logging.properties"
        "${_pkgloc}/${pkgname}/standalone/configuration/mgmt-groups.properties"
        "${_pkgloc}/${pkgname}/standalone/configuration/mgmt-users.properties"
        "${_pkgloc}/${pkgname}/standalone/configuration/standalone.xml"
        "${_pkgloc}/${pkgname}/bin/add-user.properties"
        "${_pkgloc}/${pkgname}/bin/appclient.conf"
        "${_pkgloc}/${pkgname}/bin/domain.conf"
        "${_pkgloc}/${pkgname}/bin/jboss-cli-logging.properties"
        "${_pkgloc}/${pkgname}/bin/jboss-cli.xml"
        "${_pkgloc}/${pkgname}/bin/standalone.conf"
        "${_cfgloc}/${pkgname}/${pkgname}.conf")
options=(!strip)
install="${pkgname}.install"
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}.Final/${pkgname}-${pkgver}.Final.tar.gz"
        "${pkgname}-sysusers.conf"
        "${pkgname}-tmpfiles.conf")
sha256sums=('c72892c996b05bfa78c6c632f1a5d4680523d3efb4c0321fa8485f052e15fba9'
            'd2c43e331a76c363a621db3bff3db93889388fd656bf786e1dc7c2a8283046ac'
            '796faf23aba8acacd40701dae855e66990ac3c62e71903095200023adb6e8540')

package() {
    echo "   -> Removing unneeded .bat and .ps1 files..."
    rm -f "${pkgname}-${pkgver}.Final/bin/"*.{bat,ps1}
    echo "   -> Unpacking the package files..."
    install -d -m 755 "${pkgdir}/${_pkgloc}"
    cp -R "${pkgname}-${pkgver}.Final" "${pkgdir}/${_pkgloc}/${pkgname}"
    install -D -m 644 "${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -D -m 644 "${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    cd "${pkgname}-${pkgver}.Final/docs/contrib/scripts/systemd"
    echo "   -> Creating wildfly.conf (environment settings)..."
    install -D -t "${pkgdir}/${_cfgloc}/${pkgname}" -m 644 wildfly.conf
    echo "   -> Placing wildfly.service in /$_sysdloc..."
    # fix pid file location
    sed -i 's|PIDFile=/var/run/wildfly/wildfly\.pid|PIDFile=/run/wildfly/wildfly\.pid|' wildfly.service
    install -D -t "${pkgdir}/${_sysdloc}" -m 644 wildfly.service
    echo "   -> Copying launch.sh to the bin directory..."
    install -D -t "${pkgdir}/${_pkgloc}/${pkgname}/bin" -m 755 launch.sh
    chmod -R u=rwX,g=rwX,o=rX "${pkgdir}/${_pkgloc}/${pkgname}"
}
# vim:set ts=4 sw=4 et:
