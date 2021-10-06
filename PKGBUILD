# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=removegrainhd
pkgname=avisynth-plugin-${_plug}-git
pkgver=v0.7.7.g7444ef7
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/RemoveGrainHD'
license=('MIT')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/RemoveGrainHD.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/RemoveGrainHD/"{avs*,avi*}
}

build() {
  cd build

  CXXFLAGS+=" $(pkg-config --cflags avisynth)"

  cmake "../${_plug}" \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr \

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/RemoveGrainHD/documentation/RemoveGrainHD.htm" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/RemoveGrainHD.htm"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/${_plug}/README.md"
}
