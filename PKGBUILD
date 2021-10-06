# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=tivtc
pkgname=avisynth-plugin-${_plug}-git
pkgver=v1.0.26.16.g9c47880
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/TIVTC'
license=('GPL')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/TIVTC.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/src/include/"{avs*,avi*}
}

build() {
  cd build

  CXXFLAGS+=" $(pkg-config --cflags avisynth)"

  cmake "../${_plug}/src" \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr \

  make

  cd ..
  make -C "${srcdir}/${_plug}/RetrieveRanges"
}

package(){
  make -C build DESTDIR="${pkgdir}" install

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
