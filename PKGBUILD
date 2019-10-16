# Maintainer: Jochem Broekhoff <(lastname) dot (firstname) @ gmail.com>
pkgname=iot-inspector-client
pkgver=2
pkgrel=1
pkgdesc="A standalone desktop app that lets you analyze your home IoT devices"
arch=('any')
license=('MIT')
url="https://iot-inspector.princeton.edu/blog/"
_revision="1b6af10888c452b39a3e90216ca298f8f27523e3"

depends=('python'
         'python2'
         'python2-flask'
         'python2-flask-cors'
         'python2-requests'
         'python2-netaddr'
         'python2-scapy'
         'python-netdisco')

source=("https://github.com/noise-lab/iot-inspector-client/archive/${_revision}.zip"
        "launch.sh")
sha256sums=('f51f7320139fb5a8794aef64343e1c033605ed7702a0b476a74fbea28e67189b'
            'SKIP')

prepare() {
    # Patch usage of old Scapy modules
    sed -e "s/import scapy_http.http as http/from scapy.layers import http/" \
        -e "s/import scapy_ssl_tls.ssl_tls as ssl_tls # noqa/from scapy.layers import tls/" \
        -i "${srcdir}/${pkgname}-${_revision}/v2-src/packet_processor.py"
}

package() {
    cd "${srcdir}/${pkgname}-${_revision}/v2-src"

    mkdir -p "${pkgdir}/usr/lib/${pkgname}"

    # Copy primary files
    cp -t "${pkgdir}/usr/lib/${pkgname}" *.py

    # Launch file
    install -Dm755 "${srcdir}/launch.sh" \
            "${pkgdir}/usr/bin/${pkgname}"

    # Licenses
    install -Dm644 "${srcdir}/${pkgname}-${_revision}/LICENSE.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
