# Maintainer: David Parrish <daveparrish@tutanota.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=bisq2
pkgver=2.1.11
pkgrel=1
pkgdesc="The Decentralized Trading Platform"
arch=('x86_64')
url="https://bisq.network"
license=('AGPL3')
depends=('java-runtime>=21' 'tor')
makedepends=('java-environment=21' 'git')
source=("git+https://github.com/bisq-network/bisq2#tag=v$pkgver"
  "git+https://github.com/bisq-network/bitcoind.git"
  "bisq2.desktop")
sha256sums=('2ef4b1424eb64b346344dcb8748b2824761eae380a2d58883a1fb7e9f7fc4d45'
            'SKIP'
            '4168bef82a5330ddaaa7b5055b1107d6eb912cd6b071c29220262173a4b8d61f')

_binname=Bisq2
provides=("bisq2")

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.wallets/bitcoind.url "$srcdir/bitcoind"
  git -c protocol.file.allow=always submodule update
}

build() {
  # Hardcode java-21-openjdk because Bisq2 doesnt work after building with other versions.
  export PATH="/usr/lib/jvm/java-21-openjdk/bin:$PATH"
  export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"
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
