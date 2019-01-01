# Maintainer : Thanos Apostolou <thanosapostolou@outlook.com>

# Build notes:
# https://phoenicisorg.github.io/phoenicis/Users/build/

pkgname=phoenicis
_pkgver=5.0-alpha.2
pkgver=5.0alpha2
pkgrel=1
pkgdesc="Phoenicis PlayOnLinux allows you to install and use non-native applications on linux"
arch=('any')
url="https://www.phoenicis.org/"
license=('LGPL3')
makedepends=('maven' 'java-environment-openjdk=11')
depends=('wine' 'java-runtime-openjdk=11')
options=(!strip)
source=(${pkgname}-${pkgver}::https://github.com/PhoenicisOrg/phoenicis/archive/v5.0-alpha.2.tar.gz)
sha256sums=('c88b8ca68c0c37f62aad4db44cef0047c09e8fd553455af15ef3265b0e3c575b')

build() {
  cd "${pkgname}-${_pkgver}"
  export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
  mvn clean package
  cd phoenicis-dist/src/scripts
  bash phoenicis-create-package.sh
}

package() {
  cd "${pkgname}-${_pkgver}/phoenicis-dist"
  
  install -d "${pkgdir}/usr/bin" \
             "${pkgdir}/usr/share/applications" \
             "${pkgdir}/usr/share/pixmaps"
  cp -a target/packages/phoenicis "${pkgdir}/usr/share"
  install -m755 src/launchers/phoenicis "${pkgdir}/usr/bin"
  install -m644 src/resources/Phoenicis.desktop "${pkgdir}/usr/share/applications"
  install -m644 src/resources/phoenicis{,-16,-32}.png "${pkgdir}/usr/share/pixmaps"
}
