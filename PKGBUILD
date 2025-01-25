# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=video2x-qt6-git
pkgver=6.4.0.r0.g4793103
pkgrel=1
pkgdesc="The Qt6 GUI for Video2X"
arch=('x86_64')
url="https://github.com/k4yt3x/video2x-qt6"
license=('ISC')
depends=('video2x' 'qt6-base' 'qt6-svg' 'spdlog')
makedepends=('git' 'cmake' 'clang' 'qt6-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    cmake -B build -S . -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_COMPILER=clang++ -DVIDEO2X_ENABLE_NATIVE=ON \
        -DUSE_EXTERNAL_VIDEO2X=ON
    cmake --build build --config Release --parallel
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

