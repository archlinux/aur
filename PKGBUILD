# Maintainer: ksj podhorsky.ksj@gmail.com 
# ParaSait <parasait at proton dot me>
# Former maintainer: Richard Neumann <mail at richard dash neumann period de>
# Former maintainer: Tobias Hübner <dasNeutrum@gmx.de>

_pkgname=sonarqube
pkgname=sonarqube-bin
pkgver=10.5.1.90531
pkgrel=1
pkgdesc="An open source platform for continuous inspection of code quality"
arch=('x86_64')
url="http://www.sonarqube.org/"
license=('LGPL3')
depends=('java-runtime=17')
optdepends=(
            'postgresql: A sophisticated object-relational DBMS')
backup=("etc/webapps/${_pkgname}/sonar.properties")
conflicts=("${_pkgname}-lts")
provides=("${_pkgname}")
options=('!strip')
source=("https://binaries.sonarsource.com/Distribution/${_pkgname}/${_pkgname}-${pkgver}.zip"
        "${_pkgname}.service"
        "${_pkgname}.tmpfiles"
        "${_pkgname}.sysusers"
        "99-${_pkgname}.conf")

sha256sums=('343470437adc70b8b808ac1c6f77491e321ca40ecef0d07bf739f5cce3bd34a5'
            'd279c05080a2998ed9759b3e357eefef331bdcde631d0edd042102ea723fe231'
            'b0204a7b86289929765c651627e9b55d02ae1f0da34184d2c05c7929d1222932'
            'a50fac609f12d3f1241bfb430a3d1b82d98f0649aff96e4a6f33bbe9733d854f'
            '682b3ab19eee18b39453fa2e99af89ba7e4ecb0f63dcebf137e65aa225a42e68')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # Copy everything except conf and logs to /usr/share/webapps/sonarqube.
    install -dm755 "${pkgdir}/usr/share/webapps/${_pkgname}"
    cp -dr --no-preserve=ownership {bin,data,elasticsearch,extensions,lib,temp,web} "${pkgdir}/usr/share/webapps/${_pkgname}/"
    
    # Delete unused files.
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/bin/macosx-universal-64"
    rm -rf "${pkgdir}/usr/share/webapps/${_pkgname}/bin/windows-x86-64"

    # Install the license.
    install -Dm644 "COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"

    # Install the configuration files to /etc/webapps/sonarqube.
    install -Dm644 "conf/sonar.properties" "${pkgdir}/etc/webapps/${_pkgname}/sonar.properties"

    # Install the systemd configuration and service files.
    cd "${srcdir}"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 ${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
    install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf


    # Install an example conf for required sysctl values (vm.max_map_count and fs.file-max); see https://docs.sonarqube.org/display/SONAR/Requirements#Requirements-Linux.
    install -Dm644 "99-${_pkgname}.conf" "${pkgdir}/usr/share/doc/${_pkgname}/99-${_pkgname}.conf"

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
