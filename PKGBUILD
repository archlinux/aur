# Maintainer: ZhymabekRoman <robanokssamit@yandex.kz>
pkgname=ncalayer
pkgver=1.1.0
pkgrel=1
pkgdesc="NCALayer digital signature application for Kazakhstan PKI"
arch=('x86_64')
url="https://github.com/ZhymabekRoman/NCALayer-Linux"
license=('MIT')
depends=('java-runtime=8' 'nss')
optdepends=('pcsclite: Smart card support')
makedepends=('wget' 'unzip' 'make')
install=ncalayer.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ZhymabekRoman/NCALayer-Linux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e30b7fbc34fe572a020b74dd6e69057bbfd72b08a968d6063a4be5151e0a6ad9')

prepare() {
    cd "${srcdir}/NCALayer-Linux-${pkgver}"

    # Download ncalayer.zip during prepare phase
    make download
    make verify
    make extract
    make extract-jar
    make install-certs.sh
}

package() {
    cd "${srcdir}/NCALayer-Linux-${pkgver}"

    # Install JAR
    install -Dm644 ncalayer.jar "${pkgdir}/usr/share/${pkgname}/ncalayer.jar"

    # Install certificates
    install -Dm644 additions/cert/root_rsa.cer "${pkgdir}/usr/share/${pkgname}/cert/root_rsa.cer"
    install -Dm644 additions/cert/nca_rsa.cer "${pkgdir}/usr/share/${pkgname}/cert/nca_rsa.cer"

    # Install certificate installer
    install -Dm755 install-certs.sh "${pkgdir}/usr/bin/${pkgname}-install-certs"

    # Install launcher
    install -Dm755 pkg/launcher.sh "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    sed 's/Exec=ncalayer/Exec=\/usr\/bin\/ncalayer/' ncalayer.desktop.template > ncalayer.desktop
    install -Dm644 ncalayer.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install icon
    install -Dm644 additions/ncalayer.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
