# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=audioresample
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.4.0.r0.g7a31d4c
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/ropagr/VS-AudioResample"
license=('MIT')
depends=(
    'vapoursynth' 
    'libsoxr'
)
makedepends=(
    'git'
    'cmake' 
    'ninja'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=(
    "${_plug}::git+${url}.git"
    "use-system-libsoxr.patch"
)
sha256sums=(
    'SKIP'       
    'b05a1121883d27ec383a55e24ca709fd63ebf37f5969f5226ecc52278698159b'
)

pkgver() {
    cd "${_plug}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_plug}"
    patch -p1 -i "$srcdir/use-system-libsoxr.patch"
}

build() {
    cmake -B build -S "${_plug}" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    install -Dm755 "build/AudioResample.so" "$pkgdir/usr/lib/vapoursynth/lib${_plug}.so"
    install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}