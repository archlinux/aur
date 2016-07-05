# Submitter: Peter Lamby <peterlamby@web.de>
# Maintainer: Max Falk <gmdfalk@gmail.com>

_pkgname=sonarqube
pkgname=${_pkgname}-lts
pkgver=5.6
pkgrel=1
pkgdesc="An open source platform for continuous inspection of code quality"
arch=("i686" "x86_64")
url="http://www.sonarqube.org/"
license=('LGPL3')

depends=('java-runtime>=8')

optdepends=('apache: a fully featured webserver'
            'mariadb: Fast SQL database server, drop-in replacement for MySQL'
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

sha256sums=('397c4eaf1d220cc2cef2075f709a4c50208dc91289e0234b0ae5954533f66994'
            'acf98543b635778a690c5d1a8796bf67de725eeda1c72856bd63ea148a892223'
            '6e024de469ebb1bc4083274412f0a5d68d5fa511c2139ce4cb1d243c51ff9535'
            '43ff10bbb495827e952225dce79da79bb800627eaa6f1d933f8f7fb408aafe6d')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # Copy everything except bin and conf to /usr/share/sonarqube.
    install -dm755 "${pkgdir}/usr/share/${_pkgname}"
    cp -dr --no-preserve=ownership {bin,data,extensions,lib,temp,web} "${pkgdir}/usr/share/${_pkgname}/"

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

    # Symbolic links because SonarQube expects a specific directory layout.
    ln -s "/var/log/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/logs"
    ln -s "/run/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/run"
    ln -s "/etc/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/conf"
    
    # Modify the service file in place to adjust the binary path to the CPU architecture. This is necessary because
    # SonarQube expects a certain directory layout. The alternative would be to patch SonarQube's config files.
    if [[ "$CARCH" == 'x86_64' ]]; then
        sed -i 's/\$ARCH/linux-x86-64/g' "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    elif [[ "$CARCH" == 'i686' ]]; then
        sed -i 's/\$ARCH/linux-x86-32/g' "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    fi
}


