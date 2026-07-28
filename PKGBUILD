# Maintainer: Masahiro Kitagawa <arctica0316@gmail.com>
# Contributor: alexisph@gmail.com
# Contributor: <trash@ps3zone.org>
# Contributor: Rikles <style.boubou@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname=lightzone
pkgver=5.0.1
pkgrel=1
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
    'lcms2'
    'lensfun'
    'libjpeg-turbo'
    'libtiff'
    'libraw'
    'libxext'
    'libxrender'
    'libxtst'
)
makedepends=('java-environment>=17'
    'autoconf'
    'gcc'
    'make'
    'git'
    'libx11'
    'pkgconf'
)

_git_url=${url}
_git_rev=7fa49816c4bbeb6a46caec11f600d16fa6d1de7c
source=("${_git_url}/archive/${_git_rev}.zip")
sha256sums=('b65f3ac4aba2a6db7acdfd63b9f6c166a0a9486964eed4ab149ec224d568a009')

prepare() {
  cd "${srcdir}/LightZone-${_git_rev}/"
}

build() {
  # https://github.com/Aries85/LightZone/issues/218#issuecomment-357868376
  MAKEFLAGS="-j1"

  cd "${srcdir}/LightZone-${_git_rev}/"
  JAVA_HOME=/usr/lib/jvm/default ./gradlew jpackageImage -x test
}

package() {
  cd "${srcdir}/LightZone-${_git_rev}/"

  _libexecdir=/usr/lib
  install -Dt "${pkgdir}/${_libexecdir}/${pkgname}" lightcrafts/build/resources/main/native/*.so

  _javadir=/usr/share/java
  _jardir="${pkgdir}/${_javadir}/${pkgname}"
  install -Dt "${_jardir}" linux/build/jpackage/lightzone/lib/app/*.jar

  # create icons and shortcuts
  _datadir=/usr/share
  install -Dt "${pkgdir}/${_datadir}/applications" linux/products/lightzone.desktop -m644
  install -Dt "${pkgdir}/${_datadir}/metainfo" linux/products/io.github.ktgw0316.LightZone.metainfo.xml -m644
  cp -a linux/icons "${pkgdir}/${_datadir}/"

  _bindir=/usr/bin
  install -Dt "${pkgdir}/${_bindir}" "lightcrafts/build/resources/main/native/dcraw_lz"
  install -t  "${pkgdir}/${_bindir}" "linux/products/${pkgname}"

  _licensedir=/usr/share/licenses
  install -Dt "${pkgdir}/${_licensedir}/${pkgname}/BSD-3-Clause.txt" COPYING -m644
}
