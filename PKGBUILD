pkgname=jitsi-videobridge-git
pkgver=r3063.a4bfc7f2
pkgrel=1
pkgdesc="Videobridge for Jitsi Meet"
arch=("x86_64")
url="https://github.com/jitsi/jitsi-videobridge"
license=("Apache")
depends=("jdk8-openjdk")
makedepends=("unzip" "maven")
provides=(jitsi-videobridge)
conflicts=(jitsi-videobridge)
backup=("etc/jitsi/videobridge/jitsi-videobridge.conf"
        "etc/jitsi/videobridge/sip-communicator.properties")
source=("jitsi-videobridge::git+https://github.com/jitsi/jitsi-videobridge.git"
        jitsi-videobridge.conf
        jitsi-videobridge.service
        sip-communicator.properties)
sha256sums=('SKIP'
            'd2746be91f361557343398b9544233f1482d60c6117db4ecaa7c7851cd347b50'
            'cad8d0dd61350201627ac209a1bfdec907e5ddc98b171a39c8e454f7fe9290dd'
            '2b7679218752c0435a1496306b447d72aafaf5b671b6eef63e58c83a67638ced')

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
    install -d "${pkgdir}/usr/share"
    cp -R "${srcdir}/jitsi-videobridge/jitsi-videobridge-2.1-SNAPSHOT/" "${pkgdir}/usr/share/jitsi-videobridge"
    install -Dm644 jitsi-videobridge.service "$pkgdir"/usr/lib/systemd/system/jitsi-videobridge.service
    install -Dm644 jitsi-videobridge.conf "$pkgdir"/etc/jitsi/videobridge/jitsi-videobridge.conf
    install -Dm644 sip-communicator.properties "${pkgdir}"/etc/jitsi/videobridge/sip-communicator.properties
}
