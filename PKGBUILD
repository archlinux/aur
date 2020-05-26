pkgname=jicofo
# https://github.com/jitsi/jicofo/releases/latest
pkgver=1.0_589
_tag="jitsi-meet_4627"
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
        jicofo.service
        jicofo.conf
        sip-communicator.properties)
sha256sums=('eaf298ee6c7c8e394ff58075e8f5f3d5791952ed2b6a1cac5596dad34113736d'
            '9c587f58a3c157b3a3f9412017df60e60610ecb342958f041faccb12ca795445'
            '3a558324a17011cf48e033ce265d45cc06a0b53e009984e841496f1cd4d7519d'
            'ed3a2c91d3f6c92f3aeae4dd852f04196ed57cc0c8a33da3bae6c1fb26b88294')

build() {
    cd "${srcdir}/${pkgname}-stable-$_tag"
    mvn package -DskipTests -Dassembly.skipAssembly=false
    unzip -o target/jicofo-1.1-SNAPSHOT-archive.zip
}

package() {
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/${pkgname}-stable-${_tag}/jicofo-1.1-SNAPSHOT/" "${pkgdir}/opt/jicofo"
    install -Dm644 jicofo.service "$pkgdir"/usr/lib/systemd/system/jicofo.service
    install -Dm644 jicofo.conf "$pkgdir"/etc/jitsi/jicofo/jicofo.conf
    install -Dm644 sip-communicator.properties "${pkgdir}"/etc/jitsi/jicofo/sip-communicator.properties
}
