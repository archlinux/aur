# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=nlm-hip
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=4.0.g63593e0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/TheFeelTrain/vs-nlm-hip'
license=('GPL')
depends=(
    'vapoursynth'
    'gcc-libs'
    'glibc'
    'rocm-hip-runtime'
    'rocm-device-libs'
)
makedepends=(
    'git'
    'cmake'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+${url}.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
    cd "${_plug}"
    echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
    cmake -S "${_plug}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -D CMAKE_CXX_COMPILER="/opt/rocm/bin/hipcc" \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -Wall -ffast-math -munsafe-fp-atomics -Rpass-analysis=kernel-resource-usage -DNDEBUG" \
    -D CMAKE_HIP_FLAGS="${CXXFLAGS} -Wall -ffast-math -munsafe-fp-atomics -Rpass-analysis=kernel-resource-usage -DNDEBUG" \
    -D GPU_TARGETS="gfx906;gfx1010;gfx1011;gfx1012;gfx1030;gfx1031;gfx1032;gfx1033;gfx1034;gfx1035;gfx1036;gfx1100;gfx1101;gfx1102;gfx1103;gfx1150;gfx1151;gfx1152;gfx1200;gfx1201"

    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
