# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=delogohd
pkgbase="foosynth-plugin-${_plug}-git"
pkgname=("avisynth-plugin-${_plug}-git"
         "vapoursynth-plugin-${_plug}-git"
         )
pkgver=r10.1.g87e6d19
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (Dual interface for Vapoursynth/Avisynth) (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=176658'
license=('GPL2')
depends=('gcc-libs')
makedepends=('git'
             'cmake'
             'vapoursynth'
             'avisynthplus'
             )
source=("${_plug}::git+https://github.com/HomeOfAviSynthPlusEvolution/DelogoHD.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"

  # unbundled
  rm -fr include/{VapourSynth,VSHelper,avisynth}.h
  rm -fr include/avs

  mkdir -p build

}

build() {
  cd "${_plug}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} $(pkg-config --cflags vapoursynth avisynth)"

  make
}

package_avisynth-plugin-delogohd-git() {
  pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
  depends=('avisynthplus')
  provides=("avisynth-plugin-${_plug}")
  conflicts=("avisynth-plugin-${_plug}")

  install -Dm644 "${_plug}/build/libDelogoHD.so" "${pkgdir}/usr/lib/avisynth/libDelogoHD.so"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"
}

package_vapoursynth-plugin-delogohd-git() {
  pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
  depends=('vapoursynth')
  provides=("vapoursynth-plugin-${_plug}")
  conflicts=("vapoursynth-plugin-${_plug}")

  install -Dm644 "${_plug}/build/libDelogoHD.so" "${pkgdir}/usr/lib/vapoursynth/libDelogoHD.so"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}