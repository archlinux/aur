# Maintainer: Your Name <your.email@example.com>
pkgname=kafkio-bin
pkgver=2.1.15
pkgrel=2
pkgdesc="A GUI application for managing and using Apache Kafka clusters"
arch=('x86_64')
url="https://kafkio.com"
license=('custom')
depends=('java-runtime>=17' 'gtk3' 'libxtst' 'libxrender' 'alsa-lib')
optdepends=('libxrandr: for multi-monitor support')
provides=('kafkio')
conflicts=('kafkio')
DLAGENTS=('https::/usr/bin/curl -gqb "" -fLC - --retry 3 --retry-delay 3 -o %o %u')
source=("${pkgname}-${pkgver}.tar.gz::https://kafkio.com/download/kafkio/${pkgver}/KafkIO-linux-${pkgver}-x64.tar.gz"
        "kafkio.desktop"
        "kafkio.install"
        "laptop_k_colour.svg")
sha256sums=('e59db12b7b63aecbe415ebd034034ee3417679648a86392b9357aea4c90291e8'
            '471bd05ff4e330918adbd69c746a6644fb2006aca40e65ad899047f6dbf56d9f'
            '5a76c0ef634149fa2ca7ac9e44b0d296affecde78921b10210c2f36e76a7c18e'
            '875b569e6358652351deb034afd68b8ee34a7e1a6e92ab7947e3e4980140e5d0')
noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
    mkdir -p "${srcdir}/KafkIO"
    tar -xzf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${srcdir}/KafkIO" --strip-components=1
}

package() {
    # Install the main application directory
    install -d "${pkgdir}/opt/kafkio"
    cp -r "${srcdir}/KafkIO/"* "${pkgdir}/opt/kafkio/"

    # Install desktop entry
    install -Dm644 "${srcdir}/kafkio.desktop" "${pkgdir}/usr/share/applications/kafkio.desktop"

    # Install icon
    install -Dm644 "${srcdir}/laptop_k_colour.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/kafkio.svg"

    # Create a wrapper script in /usr/bin
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/kafkio" << 'EOF'
#!/bin/bash
cd /opt/kafkio
exec /opt/kafkio/bin/KafkIO "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/kafkio"

    # Install license
    install -Dm644 "${srcdir}/KafkIO/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    chmod -R 755 "${pkgdir}/opt/kafkio/bin"
    chmod -R 755 "${pkgdir}/opt/kafkio/lib"
}
