# Maintainer: Masahiro Kitagawa <arctica0316@gmail.com>
# Contributor: alexisph@gmail.com
# Contributor: <trash@ps3zone.org>
# Contributor: Rikles <style.boubou@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname=lightzone
pkgver=5.0.0beta3
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
_git_rev=eb1eb292e9a70e297ad1b2ae13263371d19d9e1c
source=("${_git_url}/archive/${_git_rev}.zip")
sha256sums=('22d8c879ac5af6b771d7b665ec6d320f1fe4cfecb919a58b0c0e774f45d94b5f')

prepare() {
  cd "${srcdir}/LightZone-${_git_rev}/"
}

build() {
  # https://github.com/Aries85/LightZone/issues/218#issuecomment-357868376
  MAKEFLAGS="-j1"

  cd "${srcdir}/LightZone-${_git_rev}/"
  JAVA_HOME=/usr/lib/jvm/default ant -f linux/build.xml jar
}

package() {
  cd "${srcdir}/LightZone-${_git_rev}/"

  _libexecdir=/usr/lib
  install -dm 0755 "${pkgdir}/${_libexecdir}/${pkgname}"
  cp -pH linux/products/*.so "${pkgdir}/${_libexecdir}/${pkgname}"
  _javadir=/usr/share/java
  install -dm 0755 "${pkgdir}/${_javadir}/${pkgname}"
  cp -pH linux/products/*.jar "${pkgdir}/${_javadir}/${pkgname}"

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
