# Maintainer: David Parrish <daveparrish@tutanota.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

pkgbase=bisq
pkgname=(
  bisq-desktop
  bisq-cli
  bisq-daemon
)
pkgver=1.9.21
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk11-openjdk')
makedepends=('jdk11-openjdk' 'git')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/bisq-network/bisq/archive/v${pkgver}.tar.gz"
  "https://github.com/bisq-network/bisq/releases/download/v${pkgver}/bisq-${pkgver}.tar.gz.asc"
  "bisq.desktop")
sha256sums=('1319cdb2e477e456de728e1b22dee42bc1560a2a196e5a7c5e2cfddb35507894'
            'SKIP'
            'c510dd6a9ee2beab74dc1988a1aa3dd9d4800eef88315712367586e1f958da4c')
validpgpkeys=('B493319106CC3D1F252E19CBF806F422E222AA02') # Alejandro García

_binname=Bisq

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}" || exit
  msg2 "Building bisq..."
  sed -i '/vendor = JvmVendorSpec.AZUL/d' build-logic/commons/src/main/groovy/bisq.java-conventions.gradle
  sed -i '/implementation = JvmImplementation.VENDOR_SPECIFIC/d' build-logic/commons/src/main/groovy/bisq.java-conventions.gradle
  ./gradlew clean build --scan -Dorg.gradle.java.home=/usr/lib/jvm/java-11-openjdk -x test
}

package_bisq-desktop() {
  conflicts=("bisq-bin" "bisq-git" "bisq")
  provides=("bisq")
  replaces=("bisq")

  install -d "${pkgdir}/opt/bisq-desktop"
  cp -r "${srcdir}/${pkgbase}-${pkgver}/desktop/build/app/." "${pkgdir}/opt/bisq-desktop"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/bisq-desktop/bin/bisq-desktop" "${pkgdir}/usr/bin/bisq-desktop"

  # Install desktop launcher.
  install -Dm644 bisq.desktop "${pkgdir}/usr/share/applications/bisq-desktop.desktop"
  install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/desktop/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bisq-desktop.png"
}

package_bisq-cli() {
  install -d "${pkgdir}/opt/bisq-cli"
  cp -r "${srcdir}/${pkgbase}-${pkgver}/cli/build/app/." "${pkgdir}/opt/bisq-cli"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/bisq-cli/bin/bisq-cli" "${pkgdir}/usr/bin/bisq-cli"
}

package_bisq-daemon() {
  install -d "${pkgdir}/opt/bisq-daemon"
  cp -r "${srcdir}/${pkgbase}-${pkgver}/daemon/build/app/." "${pkgdir}/opt/bisq-daemon"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/bisq-daemon/bin/bisq-daemon" "${pkgdir}/usr/bin/bisq-daemon"
}
