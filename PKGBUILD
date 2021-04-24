# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=cain-ncnn-vulkan
pkgname=cain-ncnn-vulkan-git
pkgver=20210210.r0.g9d234b9
pkgrel=3
pkgdesc="CAIN, Channel Attention Is All You Need for Video Frame Interpolation implemented with ncnn library"
arch=('x86_64' 'i686')
url="https://github.com/nihui/cain-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'libwebp')
makedepends=('git' 'cmake' 'glslang-git' 'vulkan-headers' 'ncnn')
provides=("cain-ncnn-vulkan")
conflicts=("cain-ncnn-vulkan" "cain-ncnn-vulkan-bin")
source=('git+https://github.com/nihui/cain-ncnn-vulkan.git')
md5sums=('SKIP')

pkgver() {
    git -C ${pkgname%-git} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    sed -i 's|path_t model = PATHSTR("cain")|path_t model = PATHSTR("/usr/share/cain-ncnn-vulkan/cain/")|' "${pkgname%-git}"/src/main.cpp

    sed -i 's|return get_executable_directory() + path;|return "/usr/share/cain-ncnn-vulkan/" + path;|' "${pkgname%-git}"/src/filesystem_utils.h
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

    cd "${srcdir}/cain-ncnn-vulkan/models/"
    for f in cain/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/cain-ncnn-vulkan/"$f"
    done
}
