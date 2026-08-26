# AUR package maintainer: L1oly, Cogfly creator: Nix-main on Github
pkgname=cogfly
pkgver=1.2.5
pkgrel=1
pkgdesc="A cross-platform mod manager for Hollow Knight: Silksong."
arch=(x86_64)
url="https://github.com/Nix-main/Cogfly"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'zenity')
makedepends=('git' 'java-environment=25')
conflicts=('cogfly-bin' 'cogfly-git')
options=(!strip)
source=("git+https://github.com/Nix-main/Cogfly.git#tag=${pkgver}"
        "fix-cogfly.desktop.diff")
sha256sums=('78662871a75d250696bbaf4f1b595faf1cc163ae99150e326ae7317b9ecc8a93'
            'd0ac4308c59899dbfed91503bb138c832ccc10cdf1b2dd1745eb1676731125db')

prepare() {
  cd "${srcdir}/Cogfly"
  git apply ../fix-cogfly.desktop.diff
}

build() {
  cd "${srcdir}/Cogfly"
  chmod +x ./gradlew
  ./gradlew clean shadowJar
  mkdir -p out
  /usr/lib/jvm/java-25-openjdk/bin/jpackage \
            --input build/libs \
            --main-jar Cogfly-${pkgver}.jar \
            --name cogfly \
            --type app-image \
            --icon resources/icons/icon.png \
            --app-version ${pkgver} \
            --dest out
}

package() {
  install -dm755 "${pkgdir}/opt/Cogfly"
  cp -a "Cogfly/out/cogfly/"* "${pkgdir}/opt/Cogfly/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/Cogfly/bin/cogfly" "${pkgdir}/usr/bin/cogfly"

  install -Dm644 ${srcdir}/Cogfly/resources/linux/Cogfly.desktop \
    "${pkgdir}/usr/share/applications/cogfly.desktop"
  install -Dm644 ${srcdir}/Cogfly/resources/icons/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cogfly.png"
}
