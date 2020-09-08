# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=purewriter-desktop
_pkgname=desktop
pkgver=0.3.1
pkgrel=1
pkgdesc="Pure Writer Desktop"
arch=('x86_64')
url="https://github.com/PureWriter/desktop"
license=('GPL3')
depends=('jre8-openjdk' 'java8-openjfx')
makedepends=('jdk8-openjdk')
provides=('purewriter')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PureWriter/${_pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('07ded8bdcd56378503e2a93fa5c83eea6b4f851ff9eabf9b7954b0483d3804f9'
            '91b2b38809c0c1be3570510ec0c4398fe8fd818abd349d5ed7f484f246fdbeba')
build() {
  cd ${_pkgname}-${pkgver}
  _java=$(ls /usr/lib/jvm | grep 8-openjdk)
  export JAVA_HOME=/usr/lib/jvm/$_java
  sh gradlew jfxNative
}
package() {
  cd ${_pkgname}-${pkgver}

  install -Dm 644 "build/libs/Pure Writer-${pkgver}.jar" ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
  install -Dm 644 "sketch/Pure Writer.png" ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -Dm 755 ${srcdir}/${pkgname}.sh  "${pkgdir}/usr/bin/${pkgname}"

  install -dm 755 "${pkgdir}/usr/share/applications"
  cat > ${pkgdir}/usr/share/applications/${pkgname}.desktop << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Pure Writer Desktop
Comment=Pure Writer Desktop
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
EOF
}

# vim:set sw=2 ts=2 et:
