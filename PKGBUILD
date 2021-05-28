# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mitch Bigelow <ipha00 at gmail dot com>

pkgname=ncnn
pkgver=20210525
pkgrel=1
pkgdesc="High-performance neural network inference framework optimized for the mobile platform"
url="https://github.com/Tencent/ncnn"
license=('BSD')
depends=()
makedepends=('cmake' 'glslang-git' 'vulkan-headers' 'vulkan-icd-loader' 'gcc')
conflicts=('ncnn-git')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tencent/ncnn/archive/${pkgver}.tar.gz"
)
sha256sums=('a385eb5505f09e59ae486fa89584e5a15d4c45e7463927bbdddf9060d81b9a18')

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
