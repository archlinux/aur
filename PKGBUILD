# Maintainer: Tobias Hübner <dasNeutrum at gmx dot de>

_pkgname=sonarqube
pkgname=${_pkgname}-lts
pkgver=6.7.6
pkgrel=1
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
source=("https://binaries.sonarsource.com/Distribution/${_pkgname}/${_pkgname}-${pkgver}.zip"
        "${_pkgname}.service"
        "${_pkgname}-tmpfile.conf"
        "${_pkgname}-user.conf"
        "99-${_pkgname}.conf")

sha256sums=('68c7cf30d9d9cb9028742ef478e50c358728fac4c680bf5285f6a4fbfc1a55a3'
            '1aeefc9db232d13a3139a27af308e30df72c8c9fd631f713e317e1ab18a24d77'
            '6e024de469ebb1bc4083274412f0a5d68d5fa511c2139ce4cb1d243c51ff9535'
            '43ff10bbb495827e952225dce79da79bb800627eaa6f1d933f8f7fb408aafe6d'
            '682b3ab19eee18b39453fa2e99af89ba7e4ecb0f63dcebf137e65aa225a42e68')

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

    # Install an example conf for required sysctl values (vm.max_map_count and fs.file-max); see https://docs.sonarqube.org/display/SONAR/Requirements#Requirements-Linux.
    install -Dm644 "99-${_pkgname}.conf" "${pkgdir}/usr/share/doc/${_pkgname}/99-${_pkgname}.conf"

    # Create symbolic links because SonarQube expects a specific directory layout.
    ln -s "/var/log/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/logs"
    ln -s "/run/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/run"
    ln -s "/etc/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/conf"
}


