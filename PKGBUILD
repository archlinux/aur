# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=masktools2
pkgname=avisynth-plugin-${_plug}-git
pkgver=2.2.30.0.g44e178b
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/masktools'
license=('custom')
depends=('libavisynth.so')
makedepends=('git'
             'cmake'
             'avisynthplus'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/masktools.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  rm -fr "${_plug}/include"
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

  install -Dm644 "${_plug}/masktools/documentation/mt_masktools.html" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/mt_masktools.html"
  install -Dm644 "${_plug}/masktools/documentation/avisynth.css" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/avisynth.css"

  install -Dm644 "${_plug}/LICENSE"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
