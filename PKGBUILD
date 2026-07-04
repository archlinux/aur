# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=nlm-hip
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=4.0.g63593e0
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/TheFeelTrain/vs-nlm-hip'
license=('GPL')
depends=(
    'vapoursynth'
    'gcc-libs'
    'glibc'
    'rocm-hip-sdk'
    'rocm-device-libs'
)
makedepends=(
    'git'
    'cmake'
    'rocm-toolchain'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+${url}.git")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
    cd "${_plug}"
    git describe --long --tags | tr - . | tr -d v
}

build() {
    _flags="${CXXFLAGS} -Wall -ffast-math -munsafe-fp-atomics -Rpass-analysis=kernel-resource-usage -DNDEBUG"

    cmake -S "${_plug}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -D CMAKE_CXX_COMPILER="/opt/rocm/bin/hipcc" \
    -D CMAKE_CXX_FLAGS="${_flags}" \
    -D CMAKE_HIP_FLAGS="${_flags}" \
    -D GPU_TARGETS="$(rocm-supported-gfx)"

    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}