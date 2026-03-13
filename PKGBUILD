# Maintainer: Your Name <your.email@example.com>
pkgname=kafkio-bin
pkgver=2.1.14
pkgrel=1
pkgdesc="A GUI application for managing and using Apache Kafka clusters"
arch=('x86_64')
url="https://kafkio.com"
license=('custom')
depends=('java-runtime>=17' 'gtk3' 'libxtst' 'libxrender' 'alsa-lib')
optdepends=('libxrandr: for multi-monitor support')
provides=('kafkio')
conflicts=('kafkio')
source=("${pkgname}-${pkgver}.tar.gz::https://kafkio.com/download/kafkio/${pkgver}/KafkIO-linux-${pkgver}-x64.tar.gz"
        "kafkio.desktop"
        "kafkio.install"
        "laptop_k_colour.svg")
sha256sums=('d8a242913fd2666763f8b22eed4a272dca2ae40a694bde52e2f95502f9357275'
            '1801ab5d78e86b0c2efded3466fd9054e89df4e50a6bed7d2cedc152c688ff76'
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
