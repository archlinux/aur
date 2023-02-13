# Maintainer: jooch <jooch at gmx dot com>
pkgname=universal-gcode-sender
pkgver=2.0.14
pkgrel=1
pkgdesc="Java based GRBL compatible cross-platform G-Code sender"
arch=(any)
url="https://github.com/winder/Universal-G-Code-Sender"
license=(GPL3)
makedepends=(jdk13-openjdk-bin npm maven)
depends=(jdk13-openjdk-bin npm)
provides=(universal-gcode-sender)
conflicts=(universal-gcode-sender-git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/winder/Universal-G-Code-Sender/archive/v${pkgver}.tar.gz"
	"universal-gcode-sender.desktop"
	"ugs_logo_square.svg")
sha256sums=('798544adf14c39ac1f2aac0fe1c84e99d3781a89613c2f928218570ca19f49c3'
	    'bb2c016d343490bdbf666aeb1c7de479af21d9cb1c37d506e289fc9122e00b7d'
	    '821f25d7fb74e6fc831a05d3220e1a70561833f725cd43b8566854ca05290d9a')

prepare() {
  cd "${srcdir}/Universal-G-Code-Sender-${pkgver}"
}

build() {
  cd "${srcdir}/Universal-G-Code-Sender-${pkgver}"

  export MAVEN_OPTS="-Xmx2048m"
  export JAVA_HOME=/usr/lib/jvm/java-13.0.1-openjdk
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
  sed -i "/^unamestr=.*/a export PATH=/usr/lib/jvm/java-13.0.1-openjdk/bin:$PATH" ${pkgdir}/opt/universal-gcode-sender/start.sh

  # platform
  cp -a "${srcdir}/Universal-G-Code-Sender-${pkgver}/ugs-platform/application/target/ugsplatform" "${pkgdir}/opt/universal-gcode-sender/."
  sed -i "/^PRG=.*/a jdkhome=/usr/lib/jvm/java-13.0.1-openjdk" ${pkgdir}/opt/universal-gcode-sender/ugsplatform/bin/ugsplatform

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/universal-gcode-sender/start.sh" "${pkgdir}/usr/bin/ugs-classic"
  ln -s "/opt/universal-gcode-sender/ugsplatform/bin/ugsplatform" "${pkgdir}/usr/bin/ugs"

  # desktop launcher
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icons
  cp ugs_logo_square.svg "$pkgdir/opt/universal-gcode-sender/."
}
