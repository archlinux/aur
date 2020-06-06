# Maintainer: Mitch Bigelow <ipha00@gmail.com>
#

pkgname=realsr-ncnn-vulkan-git
pkgver=20200606.r0.g1a7c13e
pkgrel=1
pkgdesc="realsr super resolution implemented with ncnn library"
url="https://github.com/nihui/realsr-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-driver')
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers')
conflicts=('realsr-ncnn-vulkan')
provides=('realsr-ncnn-vulkan')
arch=('i686' 'x86_64')
source=(
    "git://github.com/nihui/realsr-ncnn-vulkan.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}/realsr-ncnn-vulkan"
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/realsr-ncnn-vulkan"

    # init ncnn submodule
    git submodule update --init --recursive

    # Fix default model path
    sed -i 's|path_t model = PATHSTR("models-DF2K_JPEG")|path_t model = PATHSTR("/usr/share/realsr-ncnn-vulkan/models-DF2K_JPEG")|' src/main.cpp
}

build() {
    cd "${srcdir}/realsr-ncnn-vulkan/src"
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
    make
}

package() {

    cd "${srcdir}/realsr-ncnn-vulkan"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm755 "src/build/realsr-ncnn-vulkan" "${pkgdir}/usr/bin/realsr-ncnn-vulkan"

    cd "${srcdir}/realsr-ncnn-vulkan/models"
    for f in models-*/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/realsr-ncnn-vulkan/"$f"
    done
}
