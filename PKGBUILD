# Maintainer: Mitch Bigelow <ipha00@gmail.com>
#

pkgname=srmd-ncnn-vulkan
pkgver=20210210
pkgrel=1
pkgdesc="SRMD super resolution implemented with ncnn library"
url="https://github.com/nihui/srmd-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-driver')
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers')
conflicts=('srmd-ncnn-vulkan-git')
# provides=('srmd-ncnn-vulkan')
arch=('i686' 'x86_64')
source=(
    "git://github.com/nihui/srmd-ncnn-vulkan.git#tag=${pkgver}"
)
sha256sums=(
    'SKIP'
)

# pkgver() {
#     cd "${srcdir}/srmd-ncnn-vulkan"
#     git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

prepare() {
    cd "${srcdir}/srmd-ncnn-vulkan"

    # init ncnn submodule
    git submodule update --init --recursive

    # Fix default model path
    sed -i 's|path_t model = PATHSTR("models-srmd")|path_t model = PATHSTR("/usr/share/srmd-ncnn-vulkan/models-srmd")|' src/main.cpp
}

build() {
    cd "${srcdir}/srmd-ncnn-vulkan/src"
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
    make
}

package() {

    cd "${srcdir}/srmd-ncnn-vulkan"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm755 "src/build/srmd-ncnn-vulkan" "${pkgdir}/usr/bin/srmd-ncnn-vulkan"

    cd "${srcdir}/srmd-ncnn-vulkan/models"
    for f in models-*/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/srmd-ncnn-vulkan/"$f"
    done
}
