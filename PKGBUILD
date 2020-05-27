# Maintainer: Martin Rys <rys.pw/#contact_me>
pkgname=jicofo-git
pkgver=r1219.39c3c5d0
pkgrel=4
epoch=
pkgdesc="JItsi Meet COnference FOcus"
arch=("x86_64")
url="https://github.com/jitsi/jicofo"
license=("Apache")
groups=()
depends=("java-runtime-headless")
makedepends=("git" "unzip" "maven")
checkdepends=()
optdepends=()
provides=("jicofo")
conflicts=("jicofo")
replaces=()
backup=("etc/jitsi/jicofo/jicofo.conf"
        "etc/jitsi/jicofo/sip-communicator.properties")
options=()
install=
changelog=
source=($pkgname::git+https://github.com/jitsi/jicofo
        jicofo.conf
        jicofo.service
        sip-communicator.properties
        sysusers.conf
        tmpfiles.conf)
noextract=()
sha256sums=('SKIP'
            '3a558324a17011cf48e033ce265d45cc06a0b53e009984e841496f1cd4d7519d'
            '82937c73200a38326e4362fcf0cbc27ad710a0c0c5708e5f84815d10dfd86a86'
            'ed3a2c91d3f6c92f3aeae4dd852f04196ed57cc0c8a33da3bae6c1fb26b88294'
            '0681e97ca1e06d8ea7bdec0a874c6fc7a6ea84628923005130cd444547a1b440'
            'b4ed1528f804056b43d47a8214f2ed853b31a8cedbafb96c26fae556df554be8')
validpgpkeys=()

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    mvn package -DskipTests -Dassembly.skipAssembly=false
    unzip -o target/jicofo-1.1-SNAPSHOT-archive.zip
}

package() {
    install -d "${pkgdir}/usr/share"
    cp -R "${srcdir}/jicofo-git/jicofo-1.1-SNAPSHOT/" "${pkgdir}/usr/share/jicofo"
    install -Dm644 jicofo.conf "$pkgdir/etc/jitsi/jicofo/jicofo.conf"
    install -Dm644 jicofo.service "$pkgdir/usr/lib/systemd/system/jicofo.service"
    install -Dm644 sip-communicator.properties "${pkgdir}/etc/jitsi/jicofo/sip-communicator.properties"
    install -Dm644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/jicofo.conf"
    install -Dm644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/jicofo.conf"
}
