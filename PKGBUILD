# Maintainer: TheFeelTrain <the@feeltra.in>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: quietvoid <tcChlisop0@gmail.com>

_plug=bm3dhip
pkgname="vapoursynth-plugin-${_plug}-git"
pkgver=2.16.2.g8c16009
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/WolframRhodium/VapourSynth-BM3DCUDA'
license=('GPL')
depends=(
    'vapoursynth'
    'rocm-hip-sdk'
    'rocm-device-libs'
    'libxml2-legacy'
)
makedepends=(
    'git'
    'cmake'
    'vapoursynth-api3-headers'
    'rocm-toolchain'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/WolframRhodium/VapourSynth-BM3DCUDA")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
    cd "${_plug}"
    git describe --long --tags | tr - . | tr -d R | sed 's|test.||g'
}

build() {
    cmake -S "${_plug}" -B build -G Ninja -LA \
        -D CMAKE_BUILD_TYPE=None \
        -D ENABLE_CPU=OFF \
        -D ENABLE_CUDA=OFF \
        -D ENABLE_HIP=ON \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_INSTALL_LIBDIR="$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")" \
        -D VAPOURSYNTH_INCLUDE_DIRECTORY="$(pkg-config --cflags vapoursynth | sed 's|-I||g')" \
        -D CMAKE_CXX_COMPILER="/opt/rocm/bin/hipcc" \
        -D CMAKE_CXX_FLAGS="${CXXFLAGS} -Wall -ffast-math -munsafe-fp-atomics -Rpass-analysis=kernel-resource-usage -DNDEBUG" \
        -D GPU_TARGETS="$(rocm-supported-gfx)"

    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
