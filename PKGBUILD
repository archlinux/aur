# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=tivtc
pkgname=avisynth-plugin-${_plug}-git
pkgver=1.0.27test1.1.g2c48472
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/TIVTC'
license=('GPL')
depends=('libavisynth.so')
makedepends=('git'
             'cmake'
             'avisynthplus'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/TIVTC.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "${_plug}"
  rm -fr src/include/{avs*,avi*}

  sed '35i#include <memory>' \
  -i src/common/info.h
}

build() {
  CXXFLAGS+=" $(pkg-config --cflags avisynth)"

  cmake -S "${_plug}/src" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build

  make -C "${srcdir}/${_plug}/RetrieveRanges"
}

package(){
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm755 "${_plug}/RetrieveRanges/RetrieveRanges" "${pkgdir}/usr/bin/RetrieveRanges"
  install -Dm644 "${_plug}/RetrieveRanges/RetrieveRanges-ReadMe.txt" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/RetrieveRanges-ReadMe.txt"

  install -Dm644 "${_plug}/Doc_TDeint/tdeint.htm" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/TDeint/tdeint.htm"

  for i in "${_plug}/Doc_TIVTC/"*.txt; do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/TIVTC/$(basename "${i}")"
  done

  cd "${_plug}/examples/"
  find . -type f -print0 | while read -d $'\0' i; do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/examples/${i}"
  done
}
