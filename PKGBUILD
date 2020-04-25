pkgname=jitsi-videobridge-git
pkgver=r3045.fdd68a74
pkgrel=2
pkgdesc="Videobridge for Jitsi Meet"
arch=("x86_64")
url="https://github.com/jitsi/jitsi-videobridge"
license=("Apache")
depends=("jdk8-openjdk")
makedepends=("unzip" "maven")
provides=(jitsi-videobridge)
conflicts=(jitsi-videobridge)
backup=("etc/jitsi-videobridge/jitsi-videobridge.conf")
source=("jitsi-videobridge::git+https://github.com/jitsi/jitsi-videobridge.git"
        service
        config)
sha256sums=("SKIP"
            "e2c923b8183d08223df47236581bdd5cae4a96df2eab8826ec661ad7ceb35944"
            "5b185655f1ddfd6003001de47bc7715686182c3991d5e33e8ebd8053559cd5ca")

pkgver() {
    cd "jitsi-videobridge"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "jitsi-videobridge"
    mvn package -DskipTests -Dassembly.skipAssembly=false
    unzip -o target/jitsi-videobridge-2.1-SNAPSHOT-archive.zip


}

package() {
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/jitsi-videobridge/jitsi-videobridge-2.1-SNAPSHOT/" "${pkgdir}/opt/jitsi-videobridge"
    install -Dm644 service "$pkgdir"/usr/lib/systemd/system/jitsi-videobridge.service
    install -Dm644 config "$pkgdir"/etc/jitsi-videobridge/jitsi-videobridge.conf
}
