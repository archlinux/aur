# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Leandro de Assis <leandrodiassis@gmail.com>
# Contributor: Thomas Dziedzic
# Contributor: Christoph Fink <christoph.fink@gmail.com>

pkgname=geoserver-bin
pkgver=2.16.0
pkgrel=1
pkgdesc="Server written in Java that allows users to share and edit geospatial data"
arch=("any")
url="http://geoserver.org"
license=("GPL2+")
depends=("jre8-openjdk-headless")


source=(
    "http://downloads.sourceforge.net/project/geoserver/GeoServer/${pkgver}/geoserver-${pkgver}-bin.zip"
    "geoserver.install"
    "geoserver.service"
    "geoserver.sysusers"
)
sha256sums=('081b8bdb6c754edee60c59200f4761837427da70760dccd856a5620db28611e7'
            '576c36670c418aa25730986e592c8b0f4a0657d3129aafbe7c783ff3ed527abe'
            'b746621be690e385341a41d850cd297e6c70e936024e6eea43f98022e53cb301'
            'edd692b53b71a684b20e0e7a87b0047aaefc2286574355fb5c08770af2652d08')

install="geoserver.install"

package() {

    cd "$srcdir/geoserver-${pkgver}"

    # create a dedicated user
    install -Dm644 ../geoserver.sysusers "${pkgdir}/usr/lib/sysusers.d/geoserver.conf"

    # clean up: remove windows file, move license file
    # to /usr/share/licenses
    rm bin/{startup,shutdown}.bat
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm LICENSE.txt

    # install geoserver to /opt/geoserver/${pkgver}
    mkdir -p "${pkgdir}/opt/geoserver/"
    cp -R "../geoserver-${pkgver}" "${pkgdir}/opt/geoserver/${pkgver}"

    # adjust data directory permissions
    find "${pkgdir}/opt/geoserver/${pkgver}/data_dir/data" -type d -exec chmod 0775 {} \;
    find "${pkgdir}/opt/geoserver/${pkgver}/data_dir/data" -type f -exec chmod 0664 {} \;

    # install geoserver as a systemd service
    sed "s/{pkgver}/${pkgver}/g" -i ../geoserver.service
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

    # install geoserver as a systemd service
    sed "s/{pkgver}/${pkgver}/g" -i ../geoserver.service
    install -Dm644 ../geoserver.service "${pkgdir}/usr/lib/systemd/system/geoserver.service"

}
