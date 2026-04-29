# Maintainer: Mario Rubio <mario at mrrb dot eu>
# Maintainer: Misaka13514 <misaka13514 at gmail dot com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Daniel Plank <tyrolyean@semi-professional.net>

pkgname=freerouting
pkgver=2.2.0
_jrever=25
_jdkver=25
pkgrel=1
pkgdesc="Advanced PCB autorouter"
arch=('any')
url="https://github.com/freerouting/freerouting"
license=('GPL-3.0-only')
depends=("java-runtime=${_jrever}")
makedepends=("java-environment-openjdk=${_jdkver}")
optdepends=('kicad: for use with PCB editor')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "freerouting.sh"
        "freerouting.desktop")
sha512sums=('601e2363182253a65fcb123f2ebc1d578f21ddec7111c80d46189f2dbdc515c4a7420727e4df06925b686ddbd9a07766e4327424666d3a2331714377d6bb9efb'
            '994102e3f526fe364920602dfa8f2160eeeeb512194172bdc82f1fb45c261c2da79b8baf58008da9ab56f33d1b047dfe1ccb2f7d4113215cdfc376319b4f9320'
            '1eeacc544cd6081a9cef03424e505177972c65dc13d1379989889c0ed7419ed1b76013d48d160d0b74932aec1170ca1535b103f4266024b7f35e9656a11281f5')

prepare() {
  cd "${pkgname}-${pkgver}"
  # disable default telemetry
  local _file="src/main/java/app/freerouting/settings/UserProfileSettings.java"
  grep -q 'public Boolean isTelemetryAllowed = true;' "$_file"
  sed -i 's/public Boolean isTelemetryAllowed = true;/public Boolean isTelemetryAllowed = false;/' "$_file"
  grep -q 'public Boolean isContactAllowed = true;' "$_file"
  sed -i 's/public Boolean isContactAllowed = true;/public Boolean isContactAllowed = false;/' "$_file"
}

build() {
  cd "${pkgname}-${pkgver}"

  export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
  ./gradlew dist
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 build/dist/freerouting-executable.jar "${pkgdir}/usr/lib/freerouting/freerouting-executable.jar"

  install -Dm755 "${srcdir}/freerouting.sh" "${pkgdir}/usr/bin/freerouting"

  install -Dm644 assets/icon/freerouting_icon_256x256_v3.png "${pkgdir}/usr/share/icons/freerouting.png"
  install -Dm644 "${srcdir}/freerouting.desktop" "${pkgdir}/usr/share/applications/freerouting.desktop"
}
