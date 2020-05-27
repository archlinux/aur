# Maintainer: Martin Rys <rys.pw/#contact_me>
pkgname=jicofo-git
pkgver=r1219.39c3c5d0
pkgrel=1
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
        sip-communicator.properties)
noextract=()
sha256sums=('SKIP'
            '3a558324a17011cf48e033ce265d45cc06a0b53e009984e841496f1cd4d7519d'
            'a28d21abcbb58ac50c974aba04360c3307a37074b420e40abd016e9d9adddd85'
            'ed3a2c91d3f6c92f3aeae4dd852f04196ed57cc0c8a33da3bae6c1fb26b88294')
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
  install -Dm644 jicofo.service "$pkgdir"/usr/lib/systemd/system/jicofo.service
  install -Dm644 jicofo.conf "$pkgdir"/etc/jitsi/jicofo/jicofo.conf
  install -Dm644 sip-communicator.properties "${pkgdir}"/etc/jitsi/jicofo/sip-communicator.properties
}
