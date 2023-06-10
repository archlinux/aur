# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: PumpkinCheshire <sollyonzou at gmail dot net>
# Contributor: Mitch Bigelow <ipha00@gmail.com>

pkgname=srmd-ncnn-vulkan
pkgver=20220728
pkgrel=1
pkgdesc="SRMD super resolution implemented with ncnn library"
url="https://github.com/nihui/srmd-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-driver' 'libwebp')
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers' 'ncnn')
conflicts=('srmd-ncnn-vulkan-git' 'srmd-ncnn-vulkan-bin')
provides=('srmd-ncnn-vulkan')
arch=('i686' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nihui/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e841ad9d2f0b4b20b6dafbfa2a078afb9d934d90376787195f5b15915ee5dc6f')

prepare() {
    sed -i 's|path_t model = PATHSTR("models-srmd")|path_t model = PATHSTR("/usr/share/srmd-ncnn-vulkan/models-srmd/")|' "${pkgname}-${pkgver}"/src/main.cpp

    sed -i 's|return get_executable_directory() + path;|return "/usr/share/srmd-ncnn-vulkan/" + path;|' "${pkgname}-${pkgver}"/src/filesystem_utils.h
}

build() {
    cmake -B build -S "${pkgname}-${pkgver}"/src \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGLSLANG_TARGET_DIR=/usr/lib/cmake \
        -DUSE_SYSTEM_NCNN=on \
        -DUSE_SYSTEM_WEBP=on
    cmake --build build
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" build/${pkgname}
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${pkgname}-${pkgver}/LICENSE

    cd "${srcdir}/${pkgname}-${pkgver}/models/"
    for f in models-*/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/${pkgname}/"$f"
    done
}
