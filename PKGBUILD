#AUR package maintainer: L1oly, Cogfly creator: Nix-main on Github
pkgname=cogfly
pkgver=1.1.2
pkgrel=2
pkgdesc="A cross-platform mod manager for Hollow Knight: Silksong."
arch=(x86_64)
url="https://github.com/Nix-main/Cogfly"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'zenity')
makedepends=('git' 'sed' 'java-environment=25')
conflicts=('cogfly-bin' 'cogfly-git')
options=(!strip)
source=("git+https://github.com/Nix-main/Cogfly.git#tag=${pkgver}")
sha256sums=('f2c7df71b1f1571569d915267444912c428faa2330add1da1d9c023e1b6305c2')

prepare() {
  cd "${srcdir}/Cogfly"
  sed -i 's/^Exec=Cogfly$/Exec=cogfly/' Cogfly.desktop
  sed -i 's/^Icon=icon$/Icon=cogfly/' Cogfly.desktop
}

build() {
  cd "${srcdir}/Cogfly"
  chmod +x ./gradlew
  ./gradlew clean shadowJar
  mkdir -p out
  /usr/lib/jvm/java-25-openjdk/bin/jpackage \
            --input build/libs \
            --main-jar Cogfly-${pkgver}.jar \
            --name ${pkgname} \
            --type app-image \
            --icon ./icons/icon.png \
            --app-version ${pkgver} \
            --dest out
}

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a Cogfly/out/${pkgname}/* "${pkgdir}/opt/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/cogfly"

  install -Dm644 ${srcdir}/Cogfly/Cogfly.desktop \
    "${pkgdir}/usr/share/applications/cogfly.desktop"
  install -Dm644 ${srcdir}/Cogfly/icons/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cogfly.png"
}
