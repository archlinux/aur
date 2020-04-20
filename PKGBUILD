pkgname=jigasi-git
pkgver=r492.31112b0
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
source=($pkgname::git+https://github.com/jitsi/jigasi)
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    mvn package -DskipTests -Dassembly.skipAssembly=false
    unzip -o target/jigasi-linux-x64-1.1-SNAPSHOT.zip
}

package() {
    cd "${srcdir}/${pkgname}"
    mkdir -p "${pkgdir}"/opt/
    cp -R "${srcdir}"/jigasi-git/jigasi-linux-x64-1.1-SNAPSHOT/ "${pkgdir}"/opt/jigasi
    install -Dm644 debian/jigasi.service "${pkgdir}"/usr/lib/systemd/system/jigasi.service
    # complete config in wiki
    mkdir -p "${pkgdir}"/etc/jitsi/jigasi
    touch "${pkgdir}"/etc/jitsi/jigasi/config
}
