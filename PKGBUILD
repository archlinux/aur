# Maintainer: David Parrish <daveparrish@tutanota.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=bisq2
pkgver=2.1.7
pkgrel=2
pkgdesc="The Decentralized Trading Platform"
arch=('x86_64')
url="https://bisq.network"
license=('AGPL3')
depends=('java-runtime>=22' 'tor')
makedepends=('java-environment>=22' 'git')
source=("git+https://github.com/bisq-network/bisq2#tag=v$pkgver"
  "git+https://github.com/bisq-network/bitcoind.git"
  "bisq2.desktop")
sha256sums=('ef6c49dac3662fd1e209ec8b1f832be4d22807a32ce834fed7341350273d5ef6'
  'SKIP'
  '5a7cbc21d30ebd7b9396f2dd012ccc9f79af76c5651586ec6c6bc6f2d514ac29')

_binname=Bisq2
provides=("bisq2")

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.wallets/bitcoind.url "$srcdir/bitcoind"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}"
  msg2 "Building bisq2..."
  ./gradlew --rerun-tasks apps:desktop:desktop-app:build
}

check() {
  cd "${srcdir}/${pkgname}"
  msg2 "Testing bisq2..."
  ./gradlew test
}

package() {
  # Install executable.
  optdir="${pkgdir}/opt/bisq2"
  install -Dm644 "${srcdir}/${pkgname}/apps/desktop/desktop-app/build/libs/desktop-app-$pkgver-linux_x86_64-all.jar" "${optdir}/lib/desktop-app-$pkgver-linux_x86_64-all.jar"
  install -Dm755 "${srcdir}/${pkgname}/apps/desktop/desktop-app/build/scriptsShadow/desktop-app" "${optdir}/bin/bisq2-desktop"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/bisq2/bin/bisq2-desktop" "${pkgdir}/usr/bin/bisq2-desktop"

  # Install desktop launcher.
  install -Dm644 bisq2.desktop "${pkgdir}/usr/share/applications/bisq2.desktop"
  install -Dm644 "${srcdir}/${pkgname}/apps/desktop/desktop-app-launcher/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bisq2.png"
}
