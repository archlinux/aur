# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
pkgname=easytaxag
pkgver=2022.1.3
pkgrel=1
pkgdesc="EasyTax Applikation zur Steuererklärung 2022 für den Kanton Aargau"
arch=('any')
url="https://msg-easytax.ch/ag/"
license=('unknown')
depends=(
  'sh'
  'hicolor-icon-theme'
  'jre17-openjdk'
)
makedepends=(
  'libicns'
  'optipng'
)
source=(
  https://msg-easytax.ch/ag/${pkgver%%.*}/EasyTax${pkgver%%.*}AG_unix_$(echo ${pkgver#*.} | sed 's/\./_/').tar.gz
  https://upload.wikimedia.org/wikipedia/commons/d/d9/Wappen_Aargau.svg

  easytaxag.desktop
  EasyTax_AG.patch
)

sha256sums=(
  '69a3886f12ee445d7e71f3c47b08cce8cf871981ff786453cf6331b34759b5d4'
  '253d315b20371cd9add777dc990f96545c60d5d07a3f34cd33720d5148e82486'
  '15671aacfbf5975c133847e531f0796bb97773946d6ca5cd7cee78b5354ee1b5'
  'ae25c2210ddb59098400c5cc70896e8a696b209da3061931d633d04d05dee477'
)

package() {
  cd "${pkgdir}"
  install -d usr/share/java
  cp -rp "${srcdir}"/EasyTax${pkgver%%.*}AG usr/share/java
  patch usr/share/java/EasyTax${pkgver%%.*}AG/EasyTax${pkgver%%.*}_AG <"${srcdir}"/EasyTax_AG.patch

  install -d usr/bin
  ln -sf /usr/share/java/EasyTax${pkgver%%.*}AG/EasyTax${pkgver%%.*}_AG usr/bin/EasyTax${pkgver%%.*}_AG

  install -Dp "${srcdir}"/EasyTax${pkgver%%.*}AG/.install4j/i4j_extf_9_4xni41_1txahfq.png usr/share/icons/hicolor/64x64/apps/easytaxag.png
  cp "${srcdir}"/EasyTax${pkgver%%.*}AG/.install4j/{i4j_extf_1_4xni41_1p83s44,easytaxag}.icns
  icns2png -x -s 128x128 -d 32 "${srcdir}"/EasyTax${pkgver%%.*}AG/.install4j/easytaxag.icns -o "${srcdir}"/EasyTax${pkgver%%.*}AG/.install4j
  optipng -o9 "${srcdir}"/EasyTax${pkgver%%.*}AG/.install4j/easytaxag_128x128x32.png
  install -Dp "${srcdir}"/EasyTax${pkgver%%.*}AG/.install4j/easytaxag_128x128x32.png usr/share/icons/hicolor/128x128/apps/easytaxag.png
  install -Dp "${srcdir}"/Wappen_Aargau.svg usr/share/icons/hicolor/scalable/apps/easytaxag.svg

  install -Dp "${srcdir}"/easytaxag.desktop usr/share/applications/easytaxag.desktop
}
