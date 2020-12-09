# Maintainer: David Parrish <daveparrish@tutanota.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=bisq
pkgver=1.5.1
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk11-openjdk' 'bash')
makedepends=('git' 'git-lfs' 'jdk11-openjdk')
source=("bisq.desktop")
sha256sums=('687d643fbe84660c3ebfe6270de98214f2e3ea791cb1d07d96d7ed889d61d406')

_binname=Bisq
conflicts=("bisq-bin" "bisq-git")
provides=("bisq")

prepare() {
  git lfs install
  rm -rf "${srcdir}/${pkgname}-${pkgver}"
  git clone --depth=1 --branch=v${pkgver} https://github.com/bisq-network/bisq.git ${pkgname}-${pkgver}
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  msg2 "Building bisq..."
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
