# Maintainer: Mitch Bigelow <ipha00@gmail.com>
# Contributor: Utkan Güngördü <utkan@freeconsole.org>
# Maintainer: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=ncnn-git
_pkgname=ncnn
pkgver=20230223.r0.gff80ac295
pkgrel=1
pkgdesc="High-performance neural network inference framework optimized for the mobile platform"
url="https://github.com/Tencent/ncnn"
license=('BSD')
depends=('glslang')
makedepends=('git' 'cmake' 'vulkan-icd-loader' 'protobuf' 'vulkan-headers')
optdepends=('protobuf: for onnx2ncnn')
conflicts=('ncnn')
provides=('ncnn')
arch=('i686' 'x86_64')
source=("git+https://github.com/Tencent/ncnn.git"
        "git+https://github.com/KhronosGroup/glslang"
        "git+https://github.com/pybind/pybind11")
sha256sums=('SKIP' 'SKIP' 'SKIP')
pkgver() {
    cd "${srcdir}/ncnn"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

    cd "${srcdir}/ncnn"

    # init submodules
    git config --file=.gitmodules submodule.glslang.url "$srcdir/glslang"
    git config --file=.gitmodules submodule.python/pybind11.url "$srcdir/pybind11"

    git -c protocol.file.allow=always submodule update --init
}

build() {
    cd "${srcdir}"
    cmake -S $_pkgname -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='Release' \
        -DNCNN_BUILD_EXAMPLES=OFF \
        -DNCNN_VULKAN=ON \
        -DNCNN_SYSTEM_GLSLANG=ON \
        -DNCNN_SHARED_LIB=ON \
        -DNCNN_ENABLE_LTO=ON \
        -DNCNN_STDIO=ON \
        -DNCNN_STRING=ON \
        -DNCNN_BUILD_TOOLS=1 \
        -DGLSLANG_TARGET_DIR=/usr/lib/cmake \
        -Wno-dev
    cmake --build build
}

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/ncnn/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
