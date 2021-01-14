# Maintainer: alexisph@gmail.com
# Contributor: <trash@ps3zone.org>
# Contributor: Rikles <style.boubou@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname=lightzone
pkgver=4.2.2
pkgrel=1
pkgdesc="Open-source professional-level digital darkroom software"
url="http://lightzoneproject.org/"
license=("custom:BSD-3-Clause")
arch=("x86_64")
conflicts=('lightzone-git')
provides=('lightzone')
depends=('java-runtime=11'
    'java-openjfx'
    'javahelp2'
    'lcms2'
    'lensfun'
    'libjpeg-turbo'
    'libtiff'
    'libxml2')
makedepends=('java-environment=11'
    'ant'
    'autoconf'
    'gcc'
    'make'
    'git'
    'libx11'
    'pkgconf'
    'rsync'
    'javahelp2'
    'lcms2'
    'libjpeg-turbo'
    'libtiff')

source=("https://github.com/ktgw0316/LightZone/archive/${pkgver}.zip")
md5sums=('c453e23b49eceafc6611b2ae0fc9b82b')

build() {
  if [ -d /usr/lib/jvm/java-11-jdk ]; then
    export JAVA_HOME=/usr/lib/jvm/java-11-jdk
  elif [ -d /usr/lib/jvm/java-11-openjdk ]; then
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
  else
    export JAVA_HOME=/usr/lib/jvm/default
  fi

  # https://github.com/Aries85/LightZone/issues/218#issuecomment-357868376
  MAKEFLAGS="-j1"

  cd "${srcdir}/LightZone-${pkgver}/"
  sed -i 's|http://repo2|https://repo1|' lightcrafts/build.xml
  ant -f linux/build.xml jar
}

package() {
  cd "${srcdir}/LightZone-${pkgver}/"

  _libexecdir=/usr/lib
  install -dm 0755 "${pkgdir}/${_libexecdir}/${pkgname}"
  cp -pH linux/products/*.so "${pkgdir}/${_libexecdir}/${pkgname}"
  _javadir=/usr/share/java
  install -dm 0755 "${pkgdir}/${_javadir}/${pkgname}"
  cp -pH lightcrafts/products/dcraw_lz "${pkgdir}/${_javadir}/${pkgname}"
  cp -pH lightcrafts/products/LightZone-forkd "${pkgdir}/${_javadir}/${pkgname}"
  cp -pH linux/products/*.jar "${pkgdir}/${_javadir}/${pkgname}"

  # create icons and shortcuts
  _datadir=/usr/share
  install -dm 0755 "${pkgdir}/${_datadir}/applications"
  install -m 644 linux/products/lightzone.desktop "${pkgdir}/${_datadir}/applications/"
  cp -pHR linux/icons "${pkgdir}/${_datadir}/"

  _bindir=/usr/bin
  install -dm 0755 "${pkgdir}/${_bindir}"
  install -m 755 "linux/products/${pkgname}" "${pkgdir}/${_bindir}"
}
