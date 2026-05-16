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
    'vapoursynth>=75'
    'rocm-hip-runtime'
    'rocm-device-libs'
    'libxml2-legacy'
)
makedepends=(
    'git'
    'cmake'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=(
    "${_plug}::git+https://github.com/WolframRhodium/VapourSynth-BM3DCUDA"
    "vapoursynth::git+https://github.com/vapoursynth/vapoursynth#commit=325756ed04588b31840fdb74479537cddcba4bf7"
)
sha256sums=(
    'SKIP'
    'SKIP'
)
options=('!debug')

pkgver() {
    cd "${_plug}"
    echo "$(git describe --long --tags | tr - . | tr -d R | sed 's|test.||g')"
}

build() {
    cmake -S "${_plug}" -B build -G Ninja -LA \
        -D CMAKE_BUILD_TYPE=Release \
        -D ENABLE_CPU=OFF \
        -D ENABLE_CUDA=OFF \
        -D ENABLE_HIP=ON \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_INSTALL_LIBDIR="$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")" \
        -D VAPOURSYNTH_INCLUDE_DIRECTORY="${srcdir}/vapoursynth/include" \
        -D CMAKE_CXX_COMPILER="/opt/rocm/bin/hipcc" \
        -D CMAKE_CXX_FLAGS="-Wall -ffast-math -munsafe-fp-atomics -Rpass-analysis=kernel-resource-usage -DNDEBUG" \
        -D GPU_TARGETS="gfx906;gfx1010;gfx1011;gfx1012;gfx1030;gfx1031;gfx1032;gfx1033;gfx1034;gfx1035;gfx1036;gfx1100;gfx1101;gfx1102;gfx1103;gfx1150;gfx1151;gfx1152;gfx1200;gfx1201"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
