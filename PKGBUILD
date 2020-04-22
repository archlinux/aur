pkgname=jigasi
pkgver=1.1
pkgrel=1
pkgdesc="Jitsi-meet SIP gateway"
arch=("x86_64")
url="https://github.com/jitsi/jigasi"
license=("Apache")
makedepends=("git" "maven")
optdepends=("jicofo"
            "jitsi-videobridge"
            "jitsi-meet")
backup=("etc/jitsi/jigasi/config"
        "opt/jigasi/jigasi-home/sip-communicator.properties")
source=($pkgname-$pkgver.tar.gz::https://github.com/jitsi/jigasi/archive/v${pkgver}.tar.gz)
md5sums=('9589a7b1fa5758e220accefeb3b8a737')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mvn package -DskipTests -Dassembly.skipAssembly=false
    unzip -o target/jigasi-linux-x64-1.1-SNAPSHOT.zip
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}"/opt/
    cp -R "${srcdir}"/${pkgname}-${pkgver}/jigasi-linux-x64-1.1-SNAPSHOT/ "${pkgdir}"/opt/jigasi
    install -Dm644 debian/jigasi.service "${pkgdir}"/usr/lib/systemd/system/jigasi.service
    install -Dm644 jigasi-home/sip-communicator.properties  "${pkgdir}/opt/jigasi/jigasi-home/sip-communicator.properties"
    # complete config in wiki
    mkdir -p "${pkgdir}"/etc/jitsi/jigasi
    touch "${pkgdir}"/etc/jitsi/jigasi/config
}
