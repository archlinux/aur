# Maintainer: Zhiya Luo <luozhiya@petalmail.com>

pkgname=mogan
pkgver=1.1.1_rc3_r241.dabfcce
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
source=("${pkgname}::git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  local _pkgver=$(awk -F '\"' '/set \(XMACS_VERSION / {print $2}' CMakeLists.txt | awk '{ sub(/-/, "_"); print $0}')_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  echo "$_pkgver"
}

prepare() {
  cd "${pkgname}"
  git submodule update --init
}

build() {
  cmake -S"${pkgname}" -Bbuild -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DTEXMACS_GUI=Qt5
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" cmake --build . --target install
}

# vim:set sw=2 sts=2 et:
