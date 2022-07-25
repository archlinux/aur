# Maintainer: Mitch Bigelow <ipha00@gmail.com>
# Contributor: Utkan Güngördü <utkan@freeconsole.org>
# Maintainer: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=ncnn-git
_pkgname=ncnn
pkgver=20220721.r5.g4158e6366
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
    git config submodule.glslang.url "$srcdir/glslang"
    git config submodule.python/pybind11.url "$srcdir/pybind11"

    git submodule update --init
}

build() {
    cd "${srcdir}/ncnn"
    if [[ ! -d build ]]
    then
        mkdir build && cd build
    else
        cd build
    fi
    cmake \
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
        -Wno-dev \
        ..
    make
}

package() {
    cd "${srcdir}/ncnn/build"
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/ncnn/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
