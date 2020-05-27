pkgname=jitsi-videobridge-git
pkgver=r3063.a4bfc7f2
pkgrel=2
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
        sip-communicator.properties
        sysusers.conf
        tmpfiles.conf)
sha256sums=('SKIP'
            'd2746be91f361557343398b9544233f1482d60c6117db4ecaa7c7851cd347b50'
            '0b3a992ae295d1c691313a10731330cc38ae9e03989fe2afc1e12fcfc7dc4539'
            '2b7679218752c0435a1496306b447d72aafaf5b671b6eef63e58c83a67638ced'
            '998cbc64def56ab98080ff7150dd0913a5e10325cd2b038cf3db14baf8cb19fc'
            '36548f4980dcdbb27e0738c3fd928005d49a7b5c2c65d7a583ebb445626074dd')
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
    install -Dm644 jitsi-videobridge.service "$pkgdir/usr/lib/systemd/system/jitsi-videobridge.service"
    install -Dm644 jitsi-videobridge.conf "$pkgdir/etc/jitsi/videobridge/jitsi-videobridge.conf"
    install -Dm644 sip-communicator.properties "${pkgdir}/etc/jitsi/videobridge/sip-communicator.properties"
    install -Dm644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/jitsi-videobridge.conf"
    install -Dm644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/jitsi-videobridge.conf"
}
