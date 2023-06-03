# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>
# Contributor: Alex Hirzel
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Leandro de Assis <leandrodiassis@gmail.com>
# Contributor: Thomas Dziedzic
# Contributor: Christoph Fink <christoph.fink@gmail.com>

pkgname=geoserver-bin
pkgver=2.23.1
pkgrel=1
pkgdesc="Server written in Java that allows users to share and edit geospatial data"
arch=("any")
url="http://geoserver.org"
license=("GPL2+")
java_ver=17
depends=("jre${java_ver}-openjdk-headless")


source=(
    "http://downloads.sourceforge.net/project/geoserver/GeoServer/${pkgver}/geoserver-${pkgver}-bin.zip"
    "geoserver.install"
    "geoserver.service"
    "geoserver.sysusers"
)
sha256sums=('d197079c3570e5ab7075ea987905df4538a8d3fa6544b4c396348c6fcd54f9fe'
            '576c36670c418aa25730986e592c8b0f4a0657d3129aafbe7c783ff3ed527abe'
            '8a785d95da48d4a97d9f3620256b2a7fe607680dc932b5ee2dbcd6473352d126'
            'edd692b53b71a684b20e0e7a87b0047aaefc2286574355fb5c08770af2652d08')

install="geoserver.install"

package() {
    # create a dedicated user
    install -Dm644 ../geoserver.sysusers "${pkgdir}/usr/lib/sysusers.d/geoserver.conf"

    # clean up: remove windows file, move license file
    # to /usr/share/licenses
    rm bin/{startup,shutdown}.bat
    licenses=(license/*)
    for license in "${licenses[@]}"
    do
        install -Dm644 $license "${pkgdir}/usr/share/licenses/${pkgname}/${license}"
        rm $license
    done

    # install geoserver to /opt/geoserver/${pkgver}
    mkdir -p "${pkgdir}/opt/geoserver/"
    cp -R . "${pkgdir}/opt/geoserver/${pkgver}"

    # adjust data directory permissions
    find "${pkgdir}/opt/geoserver/${pkgver}/data_dir/data" -type d -exec chmod 0775 {} \;
    find "${pkgdir}/opt/geoserver/${pkgver}/data_dir/data" -type f -exec chmod 0664 {} \;

    # install geoserver as a systemd service
    sed "s/{pkgver}/${pkgver}/g" -i ../geoserver.service
    sed "s/{java_ver}/${java_ver}/g" -i ../geoserver.service
    install -Dm644 ../geoserver.service "${pkgdir}/usr/lib/systemd/system/geoserver.service"

    # custom startup/shutdown links
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/geoserver/${pkgver}/bin/startup.sh" "${pkgdir}/usr/bin/geoserver-startup"
    ln -s "/opt/geoserver/${pkgver}/bin/shutdown.sh" "${pkgdir}/usr/bin/geoserver-shutdown"

    # create /etc/profile.d/ file to set environment
    # variables (used when geoserver is started manually)
    mkdir -p "${pkgdir}/etc/profile.d"
    echo "export GEOSERVER_HOME=/opt/geoserver/${pkgver}/" > "${pkgdir}/etc/profile.d/geoserver.sh"
    chmod +x "${pkgdir}/etc/profile.d/geoserver.sh"

    # Fix marlin
    # https://docs.geoserver.org/latest/en/user/production/java.html#running-on-java-17 
    rm "${pkgdir}/opt/geoserver/${pkgver}/webapps/geoserver/WEB-INF/lib/marlin-0.9.3.jar"
}
