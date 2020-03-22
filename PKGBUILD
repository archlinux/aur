# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=neo_fft3dfilter
pkgname=avisynth-plugin-${_plug}-git
pkgver=r40.8a5b194
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HomeOfAviSynthPlusEvolution/neo_FFT3D.git'
license=('GPL')
depends=('avisynthplus'
         'fftw'
         )
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfAviSynthPlusEvolution/neo_FFT3D.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/fft3dfilter/"avi*
}

build() {
  cd build
  cmake ../${_plug}/fft3dfilter \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} $(pkg-config --cflags avisynth)" \

  make
}

package(){
  install -Dm755 Release_/libFFT3DFilter.so "${pkgdir}/usr/lib/avisynth/libFFT3DFilter.so"

#   install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
