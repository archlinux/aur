# Maintainer: Chikage <chikage@939.me>

_plug=nlm
pkgname="vapoursynth-plugin-${_plug}-git"
pkgver=v2.0.g06547b7
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/AmusementClub/vs-nlm-ispc.git'
license=('GPL3')
depends=('vapoursynth'
         )
makedepends=('git'
             'cmake'
             'ispc'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/AmusementClub/vs-nlm-ispc.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}


build() {
  cmake -S "${_plug}" -B build \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_ISPC_INSTRUCTION_SETS="sse2-i32x4;avx1-i32x4;avx2-i32x8" \
    -D CMAKE_ISPC_FLAGS="--opt=fast-math"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}