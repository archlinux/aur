# Maintainer: Tobias Hübner <dasNeutrum at gmx dot de>

_pkgname=sonarqube
pkgname=${_pkgname}
pkgver=7.5
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

backup=("etc/webapps/${_pkgname}/sonar.properties"
        "etc/webapps/${_pkgname}/wrapper.conf")

conflicts=("${_pkgname}-lts")
provides=("${_pkgname}")
options=('!strip')

install=${pkgname}.install
source=("https://binaries.sonarsource.com/Distribution/${_pkgname}/${_pkgname}-${pkgver}.zip"
        "${_pkgname}.service"
        "${_pkgname}-tmpfile.conf"
        "${_pkgname}-user.conf"
        "99-${_pkgname}.conf")

sha256sums=('5076bb23dfc33ede8fdff6f8705b10f75d18c372a9f7b7b72c71c6ca6dbb7d9c'
            'c98f317003056a5774b88bf78c05d7606b5506ec7b88a682aff2e1eded50b88b'
            '2d908a2965df90a74feb0e734dabb27543f5a375ce94ce2a26b4682f462e3ea5'
            '43ff10bbb495827e952225dce79da79bb800627eaa6f1d933f8f7fb408aafe6d'
            '682b3ab19eee18b39453fa2e99af89ba7e4ecb0f63dcebf137e65aa225a42e68')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # Copy everything except conf and logs to /usr/share/webapps/sonarqube.
    install -dm755 "${pkgdir}/usr/share/webapps/${_pkgname}"
    cp -dr --no-preserve=ownership {bin,data,elasticsearch,extensions,lib,temp,web} "${pkgdir}/usr/share/webapps/${_pkgname}/"
    
    # Delete unused files.
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/bin/linux-x86-32"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/bin/macosx-universal-64"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/bin/windows-x86-32"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/bin/windows-x86-64"

    # Install the license.
    install -Dm644 "COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"

    # Install the configuration files to /etc/webapps/sonarqube.
    install -Dm644 "conf/sonar.properties" "${pkgdir}/etc/webapps/${_pkgname}/sonar.properties"
    install -Dm644 "conf/wrapper.conf" "${pkgdir}/etc/webapps/${_pkgname}/wrapper.conf"

    # Install the systemd configuration and service files.
    cd "${srcdir}"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}-user.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}-tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    # Install an example conf for required sysctl values (vm.max_map_count and fs.file-max); see https://docs.sonarqube.org/display/SONAR/Requirements#Requirements-Linux.
    install -Dm644 "99-${_pkgname}.conf" "${pkgdir}/usr/share/doc/${_pkgname}/99-${_pkgname}.conf"

    # Create symbolic links because SonarQube expects a specific directory layout.
    ln -s "/var/log/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}/logs"
    ln -s "/run/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}/run"
    ln -s "/etc/webapps/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}/conf"
}


