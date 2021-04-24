# Maintainer: Mitch Bigelow <ipha00@gmail.com>
#

pkgname=srmd-ncnn-vulkan-git
pkgver=20210210.r0.g1e14194
pkgrel=1
pkgdesc="SRMD super resolution implemented with ncnn library"
url="https://github.com/nihui/srmd-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-driver' 'libwebp')
makedepends=('git' 'cmake' 'glslang-git' 'vulkan-headers' 'ncnn')
conflicts=('srmd-ncnn-vulkan' 'srmd-ncnn-vulkan-bin')
provides=('srmd-ncnn-vulkan')
arch=('i686' 'x86_64')
source=(
    "git+https://github.com/nihui/srmd-ncnn-vulkan.git"
)
sha256sums=('SKIP')

pkgver() {
    git -C ${pkgname%-git} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    sed -i 's|path_t model = PATHSTR("models-srmd")|path_t model = PATHSTR("/usr/share/srmd-ncnn-vulkan/models-srmd/")|' "${pkgname%-git}"/src/main.cpp

    sed -i 's|return get_executable_directory() + path;|return "/usr/share/srmd-ncnn-vulkan/" + path;|' "${pkgname%-git}"/src/filesystem_utils.h
}

build() {
    cmake -B build -S "${pkgname%-git}"/src \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGLSLANG_TARGET_DIR=/usr/lib/cmake \
        -DUSE_SYSTEM_NCNN=on \
        -DUSE_SYSTEM_WEBP=on
    cmake --build build
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" build/${pkgname%-git}
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname%-git}" ${pkgname%-git}/LICENSE

    cd "${srcdir}/${pkgname%-git}/models/"
    for f in models-*/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/${pkgname%-git}/"$f"
    done
}
