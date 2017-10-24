# Maintainer: Carlos Mogas da Silva <r3pek@r3pek.org>

pkgname=mxisd
pkgver=0.5.0
pkgrel=1
pkgdesc="Federated Matrix Identity Server Daemon"
arch=('any')
url="https://github.com/kamax-io/mxisd"
license=('AGPL3')
depends=('java-runtime>=8')
makedepends=('gradle' 'java-environment>=8')
source=("https://github.com/kamax-io/${pkgname}/archive/v${pkgver}.tar.gz"
        "mxisd")
sha256sums=('436f0ea7d2ff6deac5846c72de21c04f71eab9d05c71f3716c2b33195601666b'
            '8d24a31f14dcdf85b4841e9412254e3cab357391b7e01886e54c04a6fb3cbc2e')
install='mxisd.install'

prepare() {
    cd "$pkgname-$pkgver"

    sed -i -e "s|def v = gitVersion()|def v = \"${pkgver}\"|g" build.gradle
    sed -i -e "s|\${gitVersion()}|${pkgver}|g" build.gradle
}

build() {
    cd "$pkgname-$pkgver"
    ./gradlew build
}

package() {
    cd "$pkgname-$pkgver"

    # Binaries
    install -dm 755 "${pkgdir}"/usr/lib/mxisd
    install -dm 755 "${pkgdir}"/usr/bin
    install -m 644 build/libs/mxisd-${pkgver}.jar "${pkgdir}"/usr/lib/mxisd/mxisd.jar
    install -m 755 "${srcdir}"/mxisd "${pkgdir}"/usr/bin/mxisd

    # Configuration
    install -dm 755 "${pkgdir}"/etc/mxisd
    install -m 644 application.example.yaml "${pkgdir}"/etc/mxisd/application.example.yaml

    # Systemd
    install -dm 755 "${pkgdir}"/usr/lib/systemd/system
    install -m 644 src/systemd/mxisd.service "${pkgdir}"/usr/lib/systemd/system/mxisd.service
}

