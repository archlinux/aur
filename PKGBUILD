# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=universal-gcode-sender
pkgver=2.0.6
pkgrel=1
pkgdesc="Java based GRBL compatible cross-platform G-Code sender"
arch=(any)
url="https://github.com/winder/Universal-G-Code-Sender"
license=(GPL3)
makedepends=(jdk8 npm maven)
depends=(jre8 npm)
provides=(universal-gcode-sender)
conflicts=(universal-gcode-sender-git)
source=("https://github.com/winder/Universal-G-Code-Sender/archive/v${pkgver}.tar.gz")
md5sums=('ac25e62348d9378e40487f884b770ecf')

prepare() {
  cd "${srcdir}/Universal-G-Code-Sender-${pkgver}"
  export MAVEN_OPTS="-Xmx2048m"
  mvn --batch-mode validate
}

build() {
  cd "${srcdir}/Universal-G-Code-Sender-${pkgver}"
  mvn --batch-mode package
}

package() {
  mkdir -p "${pkgdir}/opt/universal-gcode-sender"

  # classic
  cp "${srcdir}/Universal-G-Code-Sender-${pkgver}/ugs-classic/target/UniversalGcodeSender.jar" "${pkgdir}/opt/universal-gcode-sender/."
  cp "${srcdir}/Universal-G-Code-Sender-${pkgver}/ugs-classic/release_files/start.sh" "${pkgdir}/opt/universal-gcode-sender/."
  chmod +x "${pkgdir}/opt/universal-gcode-sender/start.sh"
  
  # platform
  cp -a "${srcdir}/Universal-G-Code-Sender-${pkgver}/ugs-platform/application/target/ugsplatform" "${pkgdir}/opt/universal-gcode-sender/."

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/universal-gcode-sender/start.sh" "${pkgdir}/usr/bin/ugs-classic"
  ln -s "/opt/universal-gcode-sender/ugsplatform/bin/ugsplatform" "${pkgdir}/usr/bin/ugs"
}
