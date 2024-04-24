# Maintainer: Masahiro Kitagawa <arctica0316@gmail.com>
# Contributor: alexisph@gmail.com
# Contributor: <trash@ps3zone.org>
# Contributor: Rikles <style.boubou@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname=lightzone
pkgver=5.0.0beta2
pkgrel=2
pkgdesc="Open-source professional-level digital darkroom software"
url="https://github.com/ktgw0316/LightZone/"
license=("BSD-3-Clause")
arch=("x86_64")
conflicts=('lightzone-git')
provides=('lightzone')
depends=(
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'java-runtime>=17'
    'javahelp2'
    'lcms2'
    'lensfun'
    'libjpeg-turbo'
    'libtiff'
    'libraw'
    'libxml2'
)
makedepends=('java-environment>=17'
    'ant'
    'autoconf'
    'gcc'
    'make'
    'git'
    'libx11'
    'pkgconf'
    'rsync'
)

_git_url=${url}
_patch_name="lombok_jdk21.patch"
source=("${_git_url}/archive/${pkgver}.zip"
        "${_patch_name}")
md5sums=('d3b9246311182e12fc6da5230dfcb173'
         '60e33c6550b0f342e8e71eb1c90e093c')

prepare() {
  cd "${srcdir}/LightZone-${pkgver}/"
  patch -Np1 -i "${srcdir}/${_patch_name}"
}

build() {
  if [ -d /usr/lib/jvm/java-21-openjdk ]; then
    export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
    export MAKEPKG_JAVA_VERSION=21
  elif [ -d /usr/lib/jvm/java-17-openjdk ]; then
    export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
    export MAKEPKG_JAVA_VERSION=17
  else
    export JAVA_HOME=/usr/lib/jvm/default
  fi
  echo $JAVA_HOME

  # https://github.com/Aries85/LightZone/issues/218#issuecomment-357868376
  MAKEFLAGS="-j1"

  cd "${srcdir}/LightZone-${pkgver}/"
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
