# Maintainer: Duru Can Celasun <can[at]dcc[dot]im>
# Contributor: <trash@ps3zone.org>
# Contributor: Rikles <style.boubou@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname=lightzone-git
_pkgname=lightzone
pkgver=5.0.2.r3.gad9a496d
pkgrel=1
pkgdesc="A professional photo browser and editor, like Aperture or Lightroom (latest git version)"
url="http://lightzoneproject.org/"
license=('custom:BSD-3-Clause')
arch=('x86_64')
depends=('java-runtime=21' 'lcms2' 'lensfun' 'libjpeg-turbo' 'libraw' 'libtiff' 'libxml2')
makedepends=('java-environment=21' 'git' 'libx11')
conflicts=('lightzone')
source=('git+https://github.com/ktgw0316/LightZone.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/LightZone"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# https://github.com/Aries85/LightZone/issues/218#issuecomment-357868376
MAKEFLAGS="-j1"

build() {
  cd "${srcdir}/LightZone/"
  if [ -d /usr/lib/jvm/java-21-jdk ]; then
    export JAVA_HOME=/usr/lib/jvm/java-21-jdk
  else
    export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
  fi
  export GRADLE_USER_HOME="${srcdir}/gradle-home"

  ./gradlew --no-daemon jpackageImage -x test
}

package() {
  cd "${srcdir}/LightZone/"

  install -Dm755 -t "${pkgdir}/usr/lib/${_pkgname}" lightcrafts/build/resources/main/native/*.so
  install -Dm644 -t "${pkgdir}/usr/share/java/${_pkgname}" linux/build/jpackage/${_pkgname}/lib/app/*.jar

  install -Dm644 -t "${pkgdir}/usr/share/applications" linux/products/lightzone.desktop
  install -Dm644 -t "${pkgdir}/usr/share/metainfo" linux/products/io.github.ktgw0316.LightZone.metainfo.xml
  cp -a linux/icons "${pkgdir}/usr/share/"

  install -Dm755 -t "${pkgdir}/usr/bin" lightcrafts/build/resources/main/native/dcraw_lz "linux/products/${_pkgname}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
