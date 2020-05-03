# Maintainer: Martin Rys <rys.pw/#contact_me>
pkgname=jicofo-git
pkgver=r1180.54741839
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
backup=("etc/jitsi/jicofo/jicofo.conf")
options=()
install=
changelog=
source=($pkgname::git+https://github.com/jitsi/jicofo
        config
        service
        sip-communicator.properties)
noextract=()
sha256sums=("SKIP"
            "3a558324a17011cf48e033ce265d45cc06a0b53e009984e841496f1cd4d7519d"
            "9c587f58a3c157b3a3f9412017df60e60610ecb342958f041faccb12ca795445"
            "ed3a2c91d3f6c92f3aeae4dd852f04196ed57cc0c8a33da3bae6c1fb26b88294")
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
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/jicofo-git/jicofo-1.1-SNAPSHOT/" "${pkgdir}/opt/jicofo"
  install -Dm644 service "$pkgdir"/usr/lib/systemd/system/jicofo.service
  install -Dm644 config "$pkgdir"/etc/jitsi/jicofo/jicofo.conf
  install -Dm644 sip-communicator.properties "${pkgdir}"/etc/jitsi/jicofo/sip-communicator.properties
}
