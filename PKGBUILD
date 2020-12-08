# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname=ncnn
pkgver=20201208
pkgrel=1
pkgdesc="High-performance neural network inference framework optimized for the mobile platform"
url="https://github.com/Tencent/ncnn"
license=('BSD')
depends=()
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers' 'vulkan-icd-loader')
conflicts=('ncnn-git')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tencent/ncnn/archive/${pkgver}.tar.gz")
sha256sums=('898d657d77214f4505e00e9faa6cd85ee9d3941a32b86f8e0ac0dbff6a4d510b')

prepare() {
    cd "${srcdir}/ncnn-${pkgver}"

    # fix double path
    sed -i 's|glslang/glslang|glslang|' src/gpu.cpp
}

build() {
    cd "${srcdir}/ncnn-${pkgver}"
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_TOOLCHAIN_FILE=../toolchains/host.gcc.toolchain.cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNCNN_BUILD_EXAMPLES=OFF \
        -DNCNN_BUILD_TOOLS=OFF \
        -DNCNN_VULKAN=ON \
        -DNCNN_SYSTEM_GLSLANG=ON \
        -DGLSLANG_TARGET_DIR=/usr/lib/cmake/ \
        ..
    make
}

package() {
    cd "${srcdir}/ncnn-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/ncnn-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
