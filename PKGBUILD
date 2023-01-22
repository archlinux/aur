# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=mvtools2
pkgname=avisynth-plugin-${_plug}-git
pkgver=2.7.45.40.gd8bdff7
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=173356'
license=('GPL')
depends=('libavisynth.so')
makedepends=('git'
             'cmake'
             'avisynthplus'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/mvtools.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  rm -fr {Sources,DePan,DePanEstimate}/include

  sed 's|"include/avs/config.h"|<avs/config.h>|g' \
    -i Sources/SADFunctions16.h
}

build() {

  CXXFLAGS=" $(pkg-config --cflags avisynth)"

  cmake -S "${_plug}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package(){
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_plug}/Documentation/avisynth-new.css" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/avisynth-new.css"
  install -Dm644 "${_plug}/Documentation/avisynth.css" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/avisynth.css"
  install -Dm644 "${_plug}/Documentation/mvtools2.html"  "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/mvtools2.html"

  install -Dm644 "${_plug}/Doc_Depan/depan.html"  "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/depan.html"
  install -Dm644 "${_plug}/Doc_DepanEstimate/depan.html"  "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/depanestimate.html"
}
