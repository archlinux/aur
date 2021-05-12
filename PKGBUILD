# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mitch Bigelow <ipha00 at gmail dot com>

pkgname=ncnn
pkgver=20210507
pkgrel=1
pkgdesc="High-performance neural network inference framework optimized for the mobile platform"
url="https://github.com/Tencent/ncnn"
license=('BSD')
depends=()
makedepends=('cmake' 'glslang-git' 'vulkan-headers' 'vulkan-icd-loader' 'gcc')
conflicts=('ncnn-git')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tencent/ncnn/archive/${pkgver}.tar.gz"
)
sha256sums=('b9f87aa7e7c41abfcb8e271ff2b15cebd7ecee52cd6e1fb84ebd130e1a483a52')

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
