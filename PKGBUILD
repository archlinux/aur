# Maintainer: pika02 <pikakolendo02(at)gmail.com>
#

pkgname=realsr-ncnn-vulkan
pkgver=20220728
pkgrel=1
pkgdesc="RealSR super resolution implemented with ncnn library"
url="https://github.com/nihui/realsr-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'libwebp')
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers' 'ncnn')
provides=("realsr-ncnn-vulkan")
conflicts=("realsr-ncnn-vulkan-git" "realsr-ncnn-vulkan-bin")
arch=('x86_64')
source=("https://github.com/nihui/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2f3207aff7e86d9ab11fa536d04da09cc76865821585f23f5f3a06b3a43286b1')

prepare() {
    sed -i 's|path_t model = PATHSTR("models-DF2K_JPEG")|path_t model = PATHSTR("/usr/share/realsr-ncnn-vulkan/models-DF2K_JPEG")|' "${pkgname}-${pkgver}"/src/main.cpp

    sed -i 's|return get_executable_directory() + path;|return "/usr/share/realsr-ncnn-vulkan/" + path;|' "${pkgname}-${pkgver}"/src/filesystem_utils.h
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
    for f in model*/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/${pkgname}/"$f"
    done
}
