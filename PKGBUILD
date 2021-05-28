# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=rife-ncnn-vulkan
pkgver=20210520
pkgrel=1
pkgdesc="RIFE, Real-Time Intermediate Flow Estimation for Video Frame Interpolation implemented with ncnn library."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/nihui/rife-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'libwebp')
makedepends=('git' 'cmake' 'glslang-git' 'vulkan-headers' 'ncnn')
provides=("rife-ncnn-vulkan")
conflicts=("rife-ncnn-vulkan-git" "rife-ncnn-vulkan-bin")
source=("https://github.com/nihui/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('499f095ec3d4e3ae1de912be694e7d3f5f3227ae816a1a987e9d78db05090303')

prepare() {
    sed -i 's|path_t model = PATHSTR("rife-HD")|path_t model = PATHSTR("/usr/share/rife-ncnn-vulkan/rife-HD")|' "${pkgname}-${pkgver}"/src/main.cpp

    sed -i 's|return get_executable_directory() + path;|return "/usr/share/rife-ncnn-vulkan/" + path;|' "${pkgname}-${pkgver}"/src/filesystem_utils.h
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
    for f in rife*/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/${pkgname}/"$f"
    done
}
