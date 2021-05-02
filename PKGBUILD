# Contributor: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mitch Bigelow <ipha00 at gmail dot com>

pkgname=ncnn
pkgver=20210322
pkgrel=1
pkgdesc="High-performance neural network inference framework optimized for the mobile platform"
url="https://github.com/Tencent/ncnn"
license=('BSD')
depends=()
makedepends=('cmake' 'glslang-git' 'vulkan-headers' 'vulkan-icd-loader')
conflicts=('ncnn-git')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tencent/ncnn/archive/${pkgver}.tar.gz"
)
sha256sums=('cb812a3ae1c70335fd775ff6db3027afd264751a2259604535f53d94c8a37233')

prepare() {
    cd "${srcdir}/ncnn-${pkgver}"

    # fix double path
    sed -i 's|glslang/glslang|glslang|' src/gpu.cpp
}

build() {
    cmake -B build -S "ncnn-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNCNN_BUILD_EXAMPLES=OFF \
        -DNCNN_BUILD_TOOLS=OFF \
        -DNCNN_VULKAN=ON \
        -DNCNN_SYSTEM_GLSLANG=ON \
        -DGLSLANG_TARGET_DIR=/usr/lib/cmake/ \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/ncnn-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
