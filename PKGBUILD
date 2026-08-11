# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: ksj podhorsky.ksj@gmail.com 
# Contributor: ParaSait <parasait at proton dot me>

_pkgname=sonarqube
pkgname=sonarqube-bin
pkgver=26.8.0.126808
pkgrel=1
pkgdesc="An open source platform for continuous inspection of code quality (Community Build)"
arch=('x86_64')
url="https://www.sonarsource.com/products/sonarqube/"
license=('LGPL-3.0-only')
depends=('java-runtime>=17')
optdepends=('postgresql: A sophisticated object-relational DBMS')
backup=("etc/webapps/${_pkgname}/sonar.properties")
conflicts=("${_pkgname}" "${_pkgname}-lts")
provides=("${_pkgname}")
options=('!strip' '!debug')
source=("https://binaries.sonarsource.com/Distribution/${_pkgname}/${_pkgname}-${pkgver}.zip"
        "${_pkgname}.service"
        "${_pkgname}.tmpfiles"
        "${_pkgname}.sysusers")
install="sonarqube-bin.install"
sha256sums=('ea1c5c1932f9c25350eafc4cdb1a839527c117e5d98b5fcf222a715b6b50a1f2'
            '58c0b2b9ae96a5901b8face8e35481e4c9a7feebdab6b21023805f6814a2fa98'
            'b0204a7b86289929765c651627e9b55d02ae1f0da34184d2c05c7929d1222932'
            '198fab7e6a5e9aeab55d080e5b7133be0e315706b159ebfbfb3126ddaf355aa4')

latestver() {
    curl -fsSL 'https://binaries.sonarsource.com/s3api?delimiter=/&prefix=Distribution/sonarqube/' |
    grep -oP 'Distribution/sonarqube/sonarqube-\K[0-9.]+(?=\.zip</Key>)' | sort -Vu | tail -1
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # Copy everything except conf and logs to /usr/share/webapps/sonarqube.
    install -dm755 "${pkgdir}/usr/share/webapps/${_pkgname}"
    cp -dr --no-preserve=ownership {bin,data,elasticsearch,extensions,lib,temp,web} "${pkgdir}/usr/share/webapps/${_pkgname}/"
    
    # Remove non-Linux platform files.
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/bin/macosx-universal-64"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/bin/windows-x86-64"
    rm -f "${pkgdir}/usr/share/webapps/${_pkgname}"/elasticsearch/bin/*.bat
    rm -f "${pkgdir}/usr/share/webapps/${_pkgname}"/elasticsearch/bin/*.exe
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/elasticsearch/lib/platform/windows-x64"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/elasticsearch/lib/platform/darwin-aarch64"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/elasticsearch/lib/platform/darwin-x64"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/elasticsearch/lib/platform/linux-aarch64"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/elasticsearch/lib/tools/windows-service-cli"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/bin/winsw-license"

    # ES config files ship as 640; fix so the sonarqube user can read them at runtime.
    chmod 644 "${pkgdir}/usr/share/webapps/${_pkgname}"/elasticsearch/config/*

    # Install the license.
    install -Dm644 "COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"

    # Install the configuration files to /etc/webapps/sonarqube.
    install -Dm644 "conf/sonar.properties" "${pkgdir}/etc/webapps/${_pkgname}/sonar.properties"

    # Install the systemd configuration and service files.
    cd "${srcdir}"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"

    # Create symbolic links because SonarQube expects a specific directory layout.
    ln -s "/var/log/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}/logs"
    ln -s "/run/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}/run"
    ln -s "/etc/webapps/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}/conf"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/temp"
    ln -s "/var/lib/${_pkgname}/temp" "${pkgdir}/usr/share/webapps/${_pkgname}/temp"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/data"
    ln -s "/var/lib/${_pkgname}/data" "${pkgdir}/usr/share/webapps/${_pkgname}/data"
    ln -s "/var/lib/${_pkgname}/downloads" "${pkgdir}/usr/share/webapps/${_pkgname}/extensions/downloads"
}
