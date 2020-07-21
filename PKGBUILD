pkgname=jicofo
# https://github.com/jitsi/jicofo/releases/latest
pkgver=1.0_612
_tag="jitsi-meet_4857"
pkgrel=2
pkgdesc="JItsi meet COnference FOcus"
arch=("x86_64")
url="https://github.com/jitsi/jicofo"
license=("Apache")
depends=("java-runtime-headless")
makedepends=("git" "unzip" "maven")
backup=("etc/jitsi/jicofo/jicofo.conf"
        "etc/jitsi/jicofo/sip-communicator.properties")
source=($pkgname-$pkgver.tar.gz::https://github.com/jitsi/jicofo/archive/stable/${_tag}.tar.gz
        jicofo.conf
        jicofo.service
        sip-communicator.properties
        sysusers.conf
        tmpfiles.conf)
sha256sums=('84f50d9e7b3561054b342cb776613ed3ba9f49e0198971b16fe2ecc97a8cfa5b'
            '3a558324a17011cf48e033ce265d45cc06a0b53e009984e841496f1cd4d7519d'
            'f8f7d47dfcd8654693b07a53fa9c7fe9aaa7620aa96618ff50e42f4442685914'
            'ed3a2c91d3f6c92f3aeae4dd852f04196ed57cc0c8a33da3bae6c1fb26b88294'
            '0681e97ca1e06d8ea7bdec0a874c6fc7a6ea84628923005130cd444547a1b440'
            'b4ed1528f804056b43d47a8214f2ed853b31a8cedbafb96c26fae556df554be8')

build() {
    cd "${srcdir}/${pkgname}-stable-$_tag"
    mvn package -DskipTests -Dassembly.skipAssembly=false
    unzip -o target/jicofo-1.1-SNAPSHOT-archive.zip
}

package() {
    install -d "${pkgdir}/usr/share"
    cp -R "${srcdir}/${pkgname}-stable-${_tag}/jicofo-1.1-SNAPSHOT/" "${pkgdir}/usr/share/jicofo"
    install -Dm644 jicofo.conf "$pkgdir/etc/jitsi/jicofo/jicofo.conf"
    install -Dm644 jicofo.service "$pkgdir/usr/lib/systemd/system/jicofo.service"
    install -Dm644 sip-communicator.properties "${pkgdir}/etc/jitsi/jicofo/sip-communicator.properties"
    install -Dm644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/jicofo.conf"
    install -Dm644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/jicofo.conf"
}
