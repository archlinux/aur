# Maintainer: Masahiro Kitagawa <arctica0316@gmail.com>
# Contributor: alexisph@gmail.com
# Contributor: <trash@ps3zone.org>
# Contributor: Rikles <style.boubou@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname=lightzone
pkgver=5.0.0
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
    'rsync'
)

_git_url=${url}
_git_rev=ffcc912a2fb20bf3ad434b4197d6f0e7ee863696
source=("${_git_url}/archive/${_git_rev}.zip")
sha256sums=('3946001c7f112a33cd0c510f454f17b06179e30616a3d1e74c3201110dbc7b38')

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
  install -dm 0755 "${pkgdir}/${_libexecdir}/${pkgname}"
  cp -pH linux/products/*.so "${pkgdir}/${_libexecdir}/${pkgname}"

  _javadir=/usr/share/java
  _jardir="${pkgdir}/${_javadir}/${pkgname}"
  install -dm 0755 "${_jardir}"
  cp -pH linux/build/install/LightZone/lib/*.jar "${_jardir}"

  # create icons and shortcuts
  _datadir=/usr/share
  install -dm 0755 "${pkgdir}/${_datadir}/applications"
  install -m 644 linux/products/lightzone.desktop "${pkgdir}/${_datadir}/applications/"
  cp -pHR linux/icons "${pkgdir}/${_datadir}/"

  _bindir=/usr/bin
  install -dm 0755 "${pkgdir}/${_bindir}"
  install -m 755 "linux/products/${pkgname}" "${pkgdir}/${_bindir}"
  install -m 755 "lightcrafts/products/dcraw_lz" "${pkgdir}/${_bindir}"

  _licensedir=/usr/share/licenses
  install -Dm 644 COPYING "${pkgdir}/${_licensedir}/${pkgname}/BSD-3-Clause.txt"
}
