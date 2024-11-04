# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=video2x-git
pkgver=r890.bcbe33d
pkgrel=1
pkgdesc="A machine learning-based lossless video super resolution framework"
arch=('x86_64')
url="https://github.com/k4yt3x/video2x"
license=('AGPL3')
depends=('ffmpeg' 'ncnn' 'vulkan-driver' 'opencv' 'spdlog' 'boost-libs')
makedepends=('git' 'cmake' 'make' 'clang' 'pkgconf' 'vulkan-headers' 'openmp' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
    cmake --build build --config Release --parallel
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DESTDIR="$pkgdir" cmake --install build
}
