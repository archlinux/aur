# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=neo_fft3dfilter
pkgbase="foosynth-plugin-${_plug}-git"
pkgname=("avisynth-plugin-${_plug}-git"
         "vapoursynth-plugin-${_plug}-git"
         )
pkgver=12.0.g23522f5
pkgrel=1
pkgdesc="Plugin for Vapoursynth/Avisynth: ${_plug} (Dual interface for Vapoursynth/Avisynth) (GIT version)"
arch=('x86_64')
url='https://github.com/HomeOfAviSynthPlusEvolution/neo_FFT3D'
license=('GPL2')
makedepends=('git'
             'cmake'
             'fftw'
             'tbb'
             'avisynthplus'
             'vapoursynth'
             )
source=("${_plug}::git+https://github.com/HomeOfAviSynthPlusEvolution/neo_FFT3D.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p "${_plug}/build"
}

build() {
  cd "${_plug}/build"
  cmake -S .. -B . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build .
}

package_avisynth-plugin-neo_fft3dfilter-git() {
  pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
  depends=('avisynthplus'
           'fftw'
           'tbb'
           )
  provides=("avisynth-plugin-${_plug}")
  conflicts=("avisynth-plugin-${_plug}")

  install -Dm755 "${_plug}/build/libneo-fft3d.so" "${pkgdir}/usr/lib/avisynth/libneo-fft3d.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"

  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_vapoursynth-plugin-neo_fft3dfilter-git() {
  pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
  depends=('vapoursynth'
           'fftw'
           'tbb'
           )
  provides=("vapoursynth-plugin-${_plug}")
  conflicts=("vapoursynth-plugin-${_plug}")

  install -Dm755 "${_plug}/build/libneo-fft3d.so" "${pkgdir}/usr/lib/vapoursynth/libneo-fft3d.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"

  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
