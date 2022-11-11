# Maintainer: Zhiya Luo <luozhiya@petalmail.com>
# Contributor: Hammer <topo20@protonmail.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=mogan
pkgver=1.1.1
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=('x86_64')
url='https://github.com/XmacsLabs/mogan'
license=('GPL3')
depends=("qt5-base" "qt5-svg" "freetype2" "sqlite" "libpng" "libiconv" "zlib" "libjpeg" "curl" "texlive-core" "python" "libxext")
makedepends=("git" "cmake" "ninja")
optdepends=(
  'gawk: conversion of some files'
  'ghostscript: rendering ps files'
  'imagemagick: convert images'
  'aspell: spell checking')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0d474267b7a777ae0fb22705c8515bfc24eb2de15ed69aa758dc51377fc6d9f9')

pkgver() {
  cd "${pkgname}-${pkgver}"
  local _pkgver=$(awk -F '\"' '/set \(XMACS_VERSION / {print $2}' CMakeLists.txt | awk '{ sub(/-/, "_"); print $0}')
  echo "$_pkgver"
}

prepare() {
  cd "${pkgname}-${pkgver}"
  git submodule update --init
}

build() {
  cmake -S"${pkgname}-${pkgver}" -Bbuild -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DTEXMACS_GUI=Qt5
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" cmake --build . --target install
}

# vim:set sw=2 sts=2 et:
