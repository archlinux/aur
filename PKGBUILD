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

depends=("java-environment-common")
optdepends=('apache: a fully featured webserver'
            'mariadb: Fast SQL database server, drop-in replacement for MySQL'
            'maven: a java project management and project comprehension tool'
            'postgresql: A sophisticated object-relational DBMS')

backup=("etc/${_pkgname}/sonar.properties"
        "etc/${_pkgname}/wrapper.conf")

conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=("${_pkgname}")
options=('!strip')

install=${pkgname}.install
source=("https://sonarsource.bintray.com/Distribution/${_pkgname}/${_pkgname}-${pkgver}.zip"
        "${_pkgname}.service"
        "${_pkgname}.tmpfiles")

sha256sums=('397c4eaf1d220cc2cef2075f709a4c50208dc91289e0234b0ae5954533f66994'
            'acf98543b635778a690c5d1a8796bf67de725eeda1c72856bd63ea148a892223'
            '8f830104d96c5d19ab1b72165515648595d1b32d4c03e607d78de532cdbd510c')

package() {
    cd "${srcdir}"
    local src="${srcdir}/${_pkgname}-${pkgver}"

    # Copy most files to /usr/share/sonarqube.
    install -dm755 "${pkgdir}/usr/share/${_pkgname}"
    cp -dr --no-preserve=ownership "${src}/"{bin,data,extensions,lib,temp,web} "${pkgdir}/usr/share/${_pkgname}/"

    # Install docs.
    install -Dm644 "${src}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"

    # Copy the configuration files to /etc/sonarqube.
    install -Dm644 "${src}/conf/sonar.properties" "${pkgdir}/etc/${_pkgname}/sonar.properties"
    install -Dm644 "${src}/conf/wrapper.conf" "${pkgdir}/etc/${_pkgname}/wrapper.conf"

    # Copy the service file to /usr/lib/systemd/system/sonarqube.service.
    install -Dm644 ../${_pkgname}.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    # Modify the service file in place to adjust the binary path to the CPU architecture. This is necessary because
    # SonarQube expects a certain directory layout. The alternative would be to patch SonarQube's config files.
    if [[ "$CARCH" == 'x86_64' ]]; then
        sed -i 's/\$ARCH/linux-x86-64/g' "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    elif [[ "$CARCH" == 'i686' ]]; then
        sed -i 's/\$ARCH/linux-x86-32/g' "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    fi

    # Copy the tmpfiles configuration to /usr/lib/tmpfiles.d/sonarqube.conf.
    install -Dm644 ../${_pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    # Log directory.
    install -dm755 "${pkgdir}/var/log/${_pkgname}"

    # Runtime directory and lockfile.
    install -dm755 "${pkgdir}/run/${_pkgname}"
    touch "${pkgdir}/run/${_pkgname}/SonarQube.pid"

    # Symbolic links because SonarQube expects a specific directory layout.
    ln -s "/var/log/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/logs"
    ln -s "/run/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/run"
    ln -s "/etc/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/conf"
}


