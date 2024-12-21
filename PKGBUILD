# Maintainer: David Parrish <daveparrish@tutanota.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=bisq
pkgver=1.9.18
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk11-openjdk')
makedepends=('jdk11-openjdk' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bisq-network/bisq/archive/v${pkgver}.tar.gz"
  "https://github.com/bisq-network/bisq/releases/download/v${pkgver}/bisq-${pkgver}.tar.gz.asc"
  "bisq.desktop")
sha256sums=('f4c22e999ffd4fe05b298c68402e3f11cffa838eb152487648564e6e9e99ab23'
  'SKIP'
  '687d643fbe84660c3ebfe6270de98214f2e3ea791cb1d07d96d7ed889d61d406')
validpgpkeys=('B493319106CC3D1F252E19CBF806F422E222AA02') # Alejandro García

_binname=Bisq
conflicts=("bisq-bin" "bisq-git")
provides=("bisq")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  msg2 "Building bisq..."
  sed -i '/vendor = JvmVendorSpec.AZUL/d' build-logic/commons/src/main/groovy/bisq.java-conventions.gradle
  sed -i '/implementation = JvmImplementation.VENDOR_SPECIFIC/d' build-logic/commons/src/main/groovy/bisq.java-conventions.gradle
  ./gradlew clean :desktop:build -Dorg.gradle.java.home=/usr/lib/jvm/java-11-openjdk -x test
}

package() {
  # Install executable.
  install -d "${pkgdir}/opt/bisq"
  cp -r "${srcdir}/${pkgname}-${pkgver}/desktop/build/app/"* "${pkgdir}/opt/bisq"
  cp -r "${srcdir}/${pkgname}-${pkgver}/bisq-desktop" "${pkgdir}/opt/bisq/"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/bisq/bisq-desktop" "${pkgdir}/usr/bin/bisq-desktop"

  # Install desktop launcher.
  install -Dm644 bisq.desktop "${pkgdir}/usr/share/applications/bisq.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/desktop/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bisq.png"
}
