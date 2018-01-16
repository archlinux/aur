# Maintainer: Duru Can Celasun <can[at]dcc[dot]im>
# Contributor: <trash@ps3zone.org>
# Contributor: Rikles <style.boubou@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname="lightzone-git"
_pkgname="lightzone"
pkgver=4.0.0.913.gb6b80116
pkgrel=1
pkgdesc="A professional photo browser and editor, like Aperture or Lightroom (latest git version)"
url="http://lightzoneproject.org/"
license=('custom:BSD-3-Clause')
arch=('i686' 'x86_64')
depends=('java-environment-jdk=7' 'javahelp2' 'lcms2' 'libjpeg-turbo' 'libtiff' 'libxml2')
makedepends=('java-runtime=7' 'apache-ant' 'autoconf' 'gcc' 'make' 'git' 'libx11' 'pkg-config' 'rsync' 'javahelp2' 'lcms2' 'libjpeg-turbo' 'libtiff')
conflicts=('lightzone')
source=('git+https://github.com/Aries85/LightZone.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/LightZone"
  git describe --always | sed 's|-|.|g'
}


# https://github.com/Aries85/LightZone/issues/218#issuecomment-357868376
MAKEFLAGS="-j1"

build() { 
  cd "${srcdir}/LightZone/"
  if [ -d /usr/lib/jvm/java-7-jdk ]; then
    export JAVA_HOME=/usr/lib/jvm/java-7-jdk
  else
    export JAVA_HOME=/usr/lib/jvm/java-7-openjdk
  fi
  [ -f /etc/profile.d/apache-ant.sh ] && source /etc/profile.d/apache-ant.sh
  ant -f linux/build.xml jar
}

package() {
  cd "${srcdir}/LightZone/"

  _libexecdir=/usr/lib
  install -dm 0755 "${pkgdir}/${_libexecdir}/${_pkgname}"
  ls *
  cp -pHR linux/products/*.so "${pkgdir}/${_libexecdir}/${_pkgname}"
  _javadir=/usr/share/java
  install -dm 0755 "${pkgdir}/${_javadir}/${_pkgname}"
  cp -pH lightcrafts/products/dcraw_lz "${pkgdir}/${_javadir}/${_pkgname}"
  cp -pH lightcrafts/products/LightZone-forkd "${pkgdir}/${_javadir}/${_pkgname}"
  cp -pHR linux/products/*.jar "${pkgdir}/${_javadir}/${_pkgname}"
  
  # create icons and shortcuts
  _datadir=/usr/share
  install -dm 0755 "${pkgdir}/${_datadir}/applications"
  install -m 644 linux/products/lightzone.desktop "${pkgdir}/${_datadir}/applications/"
  cp -pHR linux/icons "${pkgdir}/${_datadir}/"

  _bindir=/usr/bin
  install -dm 0755 "${pkgdir}/${_bindir}"
  install -m 755 "linux/products/${_pkgname}" "${pkgdir}/${_bindir}"
}
