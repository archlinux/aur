# Maintainer: David Parrish <daveparrish@tutanota.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=bisq2
pkgver=2.0.1
pkgrel=2
pkgdesc="The Decentralized Trading Platform"
arch=('any')
url="https://bisq.network"
license=('AGPL3')
depends=('java-runtime=17')
makedepends=('java-environment=17' 'git')
source=("git+https://github.com/bisq-network/bisq2#tag=v$pkgver"
	"bisq2.desktop")
sha256sums=('SKIP'
            '5a7cbc21d30ebd7b9396f2dd012ccc9f79af76c5651586ec6c6bc6f2d514ac29')

_binname=Bisq2
provides=("bisq2")

build() {
  cd "${srcdir}/${pkgname}" || exit
  msg2 "Building bisq2..."
  ./gradlew desktop:desktop-app:build
}

package() {
  # Install executable.
  optdir="${pkgdir}/opt/bisq2"
  install -Dm644 "${srcdir}/${pkgname}/apps/desktop/desktop-app/build/libs/desktop-app-$pkgver-all.jar" "${optdir}/lib/desktop-app-$pkgver-all.jar"
  install -Dm755 "${srcdir}/${pkgname}/apps/desktop/desktop-app/build/scriptsShadow/desktop-app" "${optdir}/bin/bisq2-desktop"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/bisq2/bin/bisq2-desktop" "${pkgdir}/usr/bin/bisq2-desktop"

  # Install desktop launcher.
  install -Dm644 bisq2.desktop "${pkgdir}/usr/share/applications/bisq2.desktop"
  install -Dm644 "${srcdir}/${pkgname}/apps/desktop/desktop-app-launcher/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bisq2.png"
}
