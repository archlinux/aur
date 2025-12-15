# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>

_plug=llvmexpr
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R4.1.2.g93a6e59
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Sunflower-Dolls/Vapoursynth-llvmexpr'
license=('GPL-3.0')
depends=(
    'vapoursynth'
    'llvm'
    'ctre'
    'volk'
    'vulkan-memory-allocator'
)
makedepends=(
    'git'
    'meson'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Sunflower-Dolls/Vapoursynth-llvmexpr.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_plug"
    git describe --long --tags | tr - . | tr -d r
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    export CC=clang
    export CXX=clang++
    arch-meson "../${_plug}" --libdir /usr/lib/vapoursynth
    ninja
}

package(){
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/LICENSE"
}