# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fft3dfilter
pkgname=avisynth-plugin-${_plug}-git
pkgver=2.10.0.g3f8d274
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/fft3dfilter'
license=('MIT')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/fft3dfilter.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/fft3dfilter/"{avs*,avi*}
}

build() {
  cd build

  CXXFLAGS+=" $(pkg-config --cflags avisynth)"

  cmake "../${_plug}" \
   -DCMAKE_BUILD_TYPE=None \
   -DCMAKE_INSTALL_PREFIX=/usr \

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/fft3dfilter/documentation/fft3dfilter.html" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/fft3dfilter.html"
  install -Dm644 "${_plug}/fft3dfilter/documentation/overlap.png" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/overlap.png"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/${_plug}/README.md"
}
