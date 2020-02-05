# Maintainer: alexisph@gmail.com
# Contributor: <trash@ps3zone.org>
# Contributor: Rikles <style.boubou@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname="lightzone"
pkgver=4.1.9
pkgrel=2
pkgdesc="A professional photo browser and editor, like Aperture or Lightroom"
url="http://lightzoneproject.org/"
license=("custom:BSD-3-Clause")
arch=("x86_64")
conflicts=('lightzone-git')
provides=('lightzone')
depends=('java-runtime=8'
    'javahelp2'
    'lcms2'
    'libjpeg-turbo'
    'libtiff'
    'libxml2')
makedepends=('java-environment=8'
    'ant'
    'autoconf'
    'gcc'
    'make'
    'git'
    'libx11'
    'pkg-config'
    'rsync'
    'javahelp2'
    'lcms2'
    'libjpeg-turbo'
    'libtiff')

source=("https://github.com/ktgw0316/LightZone/archive/${pkgver}.zip")
md5sums=('e95d9afbe7fc517d1bc79d6d2264b1b7')

# https://github.com/Aries85/LightZone/issues/218#issuecomment-357868376
MAKEFLAGS="-j1"

build() {
  cd "${srcdir}/LightZone-${pkgver}/"
  if [ -d /usr/lib/jvm/java-8-jdk ]; then
    export JAVA_HOME=/usr/lib/jvm/java-8-jdk
  else
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
  fi

  sed -i 's|http://repo2|https://repo1|' lightcrafts/build.xml
  ant -f linux/build.xml jar
}

package() {
  cd "${srcdir}/LightZone-${pkgver}/"

  _libexecdir=/usr/lib
  install -dm 0755 "${pkgdir}/${_libexecdir}/${pkgname}"
  cp -pHR linux/products/*.so "${pkgdir}/${_libexecdir}/${pkgname}"
  _javadir=/usr/share/java
  install -dm 0755 "${pkgdir}/${_javadir}/${pkgname}"
  cp -pH lightcrafts/products/dcraw_lz "${pkgdir}/${_javadir}/${pkgname}"
  cp -pH lightcrafts/products/LightZone-forkd "${pkgdir}/${_javadir}/${pkgname}"
  cp -pHR linux/products/*.jar "${pkgdir}/${_javadir}/${pkgname}"

  # create icons and shortcuts
  _datadir=/usr/share
  install -dm 0755 "${pkgdir}/${_datadir}/applications"
  install -m 644 linux/products/lightzone.desktop "${pkgdir}/${_datadir}/applications/"
  cp -pHR linux/icons "${pkgdir}/${_datadir}/"

  _bindir=/usr/bin
  install -dm 0755 "${pkgdir}/${_bindir}"
  install -m 755 "linux/products/${pkgname}" "${pkgdir}/${_bindir}"
}
