# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=video2x-git
pkgver=r849.5712796
pkgrel=1
pkgdesc="A lossless video upscaling program and library"
arch=('x86_64')
url="https://github.com/k4yt3x/video2x"
license=('AGPL3')
depends=('ffmpeg' 'ncnn' 'vulkan-driver')
makedepends=('git' 'cmake' 'make' 'clang' 'pkgconf' 'vulkan-headers')
source=("git+${url}.git#branch=dev")
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
    cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel $(nproc)
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DESTDIR="$pkgdir" cmake --install build
}
