# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=video2x-git
pkgver=r941.7ee9d60
pkgrel=1
pkgdesc="A machine learning-based video super resolution and frame interpolation framework"
arch=('x86_64')
url="https://github.com/k4yt3x/video2x"
license=('AGPL3')
depends=('ffmpeg' 'ncnn' 'vulkan-driver' 'spdlog' 'boost-libs')
makedepends=('git' 'cmake' 'clang' 'vulkan-headers' 'openmp' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_COMPILER=clang++ -DVIDEO2X_ENABLE_NATIVE=ON
    cmake --build build --config Release --parallel
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
