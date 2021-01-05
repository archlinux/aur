# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=universal-gcode-sender
pkgver=2.0.7
pkgrel=1
pkgdesc="Java based GRBL compatible cross-platform G-Code sender"
arch=(any)
url="https://github.com/winder/Universal-G-Code-Sender"
license=(GPL3)
makedepends=(java-environment-jdk=8 npm maven)
depends=(java-environment-jdk=8 npm)
provides=(universal-gcode-sender)
conflicts=(universal-gcode-sender-git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/winder/Universal-G-Code-Sender/archive/v${pkgver}.tar.gz")
sha256sums=('fa181573087c414fbb29cdb94dcf0a324e3d96948a1334f2e698785a69e35b02')

prepare() {
  cd "${srcdir}/Universal-G-Code-Sender-${pkgver}"
}

build() {
  cd "${srcdir}/Universal-G-Code-Sender-${pkgver}"

  export MAVEN_OPTS="-Xmx2048m"
  export JAVA_HOME=/usr/lib/jvm/java-8-jdk
  mvn test install -B -Djava.util.logging.config.file=scripts/logging.config
  mvn package -pl ugs-classic assembly:assembly -DskipTests=true
  mvn package -pl ugs-platform/application -P create-linux-package -DskipTests=true
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
