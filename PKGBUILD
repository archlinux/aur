# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=nlm-hip
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.0.g922cc61
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/TheFeelTrain/vs-nlm-hip'
license=('GPL')
depends=(
    'vapoursynth>=75'
    'gcc-libs'
    'glibc'
    'rocm-hip-runtime'
    'rocm-device-libs'
)
makedepends=(
    'git'
    'cmake'
    'vapoursynth-api3-headers'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_plug}"
    echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
    CMAKE_PREFIX_PATH=/opt/rocm \
    CXX=/opt/rocm/llvm/bin/clang++ \
    cmake -S "${_plug}" -B build \
    -DCMAKE_BUILD_TYPE=None

    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    rm -r "${pkgdir}/usr/local" # Remove stray manifest.vs file
    install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
