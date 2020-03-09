# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=minideen
pkgbase="foosynth-plugin-${_plug}-git"
pkgname=("avisynth-plugin-${_plug}-git"
         "vapoursynth-plugin-${_plug}-git"
         )
pkgver=r5.0.gaeb7275
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (Dual interface for Vapoursynth/Avisynth) (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=176554'
license=('ISC' 'MIT')
depends=('gcc-libs')
makedepends=('git'
             'cmake'
             'clang'
             'avisynthplus'
             'vapoursynth'
             )
source=("${_plug}::git+https://github.com/HomeOfAviSynthPlusEvolution/minideen.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"

  # unbundle
  rm -fr include

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

package_avisynth-plugin-minideen-git() {
  pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
  depends=('avisynthplus')
  provides=("avisynth-plugin-${_plug}")
  conflicts=("avisynth-plugin-${_plug}")

  install -Dm644 "${_plug}/build/libMiniDeen.so" "${pkgdir}/usr/lib/avisynth/libMiniDeen.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"

  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_vapoursynth-plugin-minideen-git() {
  pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
  depends=('vapoursynth')
  provides=("vapoursynth-plugin-${_plug}")
  conflicts=("vapoursynth-plugin-${_plug}")

  install -Dm644 "${_plug}/build/libMiniDeen.so" "${pkgdir}/usr/lib/vapoursynth/libMiniDeen.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"

  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
