# Maintainer: Tobias Hübner <dasNeutrum at gmx dot de>

_pkgname=sonarqube
pkgname=${_pkgname}-lts
pkgver=6.7.1
pkgrel=2
pkgdesc="An open source platform for continuous inspection of code quality"
arch=('x86_64')
url="http://www.sonarqube.org/"
license=('LGPL3')

depends=('java-runtime>=8')

optdepends=('apache: a fully featured webserver'
            'mysql: Fast SQL database server, community edition'
            'maven: a java project management and project comprehension tool'
            'postgresql: A sophisticated object-relational DBMS')

backup=("etc/${_pkgname}/sonar.properties"
        "etc/${_pkgname}/wrapper.conf")

conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')

install=${pkgname}.install
source=("https://sonarsource.bintray.com/Distribution/${_pkgname}/${_pkgname}-${pkgver}.zip"
        "${_pkgname}.service"
        "${_pkgname}-tmpfile.conf"
        "${_pkgname}-user.conf")

sha256sums=('74cc70ef75d83fa260c7be86863416f45e092f77a2582ab51529d84f9a696fc7'
            'cb3e3e810892e4d7ccf7a843ae1cb7daa14e3395025d0cc505b562f45e4f1ee9'
            '6e024de469ebb1bc4083274412f0a5d68d5fa511c2139ce4cb1d243c51ff9535'
            '43ff10bbb495827e952225dce79da79bb800627eaa6f1d933f8f7fb408aafe6d')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # Copy everything except conf and logs to /usr/share/sonarqube.
    install -dm755 "${pkgdir}/usr/share/${_pkgname}"
    cp -dr --no-preserve=ownership {bin,data,elasticsearch,extensions,lib,temp,web} "${pkgdir}/usr/share/${_pkgname}/"
    
    # Delete unused files.
    rm -rf "${pkgdir}/usr/share/${_pkgname}/bin/linux-x86-32"
    rm -rf "${pkgdir}/usr/share/${_pkgname}/bin/macosx-universal-64"
    rm -rf "${pkgdir}/usr/share/${_pkgname}/bin/windows-x86-32"
    rm -rf "${pkgdir}/usr/share/${_pkgname}/bin/windows-x86-64"

    # Install the license.
    install -Dm644 "COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"

    # Install the configuration files to /etc/sonarqube.
    install -Dm644 "conf/sonar.properties" "${pkgdir}/etc/${_pkgname}/sonar.properties"
    install -Dm644 "conf/wrapper.conf" "${pkgdir}/etc/${_pkgname}/wrapper.conf"

    # Install the systemd configuration and service files.
    cd "${srcdir}"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}-user.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}-tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    # Create symbolic links because SonarQube expects a specific directory layout.
    ln -s "/var/log/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/logs"
    ln -s "/run/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/run"
    ln -s "/etc/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/conf"
}


