# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq-git
pkgver=0.6.7.r309.g1d0591084
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bitsquare.io/"
license=('AGPL3')
depends=('java-openjfx')
makedepends=('maven' 'jdk8-openjdk' 'protobuf')
source=("${pkgname}::git+https://github.com/bisq-network/exchange.git#branch=master"
        "bisq.sh"
        "bisq.desktop")
sha256sums=('SKIP'
            '175e18841dd216ca84391a89b0fba0b12bf575ec095d200ae9a3babc83693e31'
            '86cf1a58d3162a3d3e8019c3439e89d0e3c66a49cbebf4b49fdb78f25dc4758a')

pkgver() {
  cd "$pkgname" || exit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  msg 'Fixing protoc path...'
  sed -i 's#/usr/local/bin/protoc#/usr/bin/protoc#g' "$pkgname/common/pom.xml"
}

build() {
  # Use a temporary local maven repository.
  local mvn_repo="$srcdir/mvn-repository"

  cd "${srcdir}/${pkgname}" || exit
  msg2 "Building bisq..."
  mvn clean package verify -Dmaven.repo.local="$mvn_repo" -DskipTests -Dmaven.javadoc.skip=true
}

package() {
  # Install executable.
  install -D -m755 "bisq.sh" "${pkgdir}/usr/bin/bisq"
  install -D -m644 "${srcdir}/${pkgname}/gui/target/shaded.jar" "${pkgdir}/usr/share/java/bisq/shaded.jar"

  install -D "${srcdir}/${pkgname}/gui/target/gui-${pkgver%.*.*}.jar" "${pkgdir}/usr/share/java/bisq"

  install -d "${pkgdir}/usr/share/java/bisq/lib"
  install -D "${srcdir}/${pkgname}/gui/target/lib/bcpg-jdk15on.jar" "${pkgdir}/usr/share/java/bisq/lib"
  install -D "${srcdir}/${pkgname}/gui/target/lib/bcprov-jdk15on.jar" "${pkgdir}/usr/share/java/bisq/lib"

  # Install desktop launcher.
  install -Dm644 bisq.desktop "${pkgdir}/usr/share/applications/bisq.desktop"
  install -Dm644 "${srcdir}/${pkgname}/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bisq.png"

  }
