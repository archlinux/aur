# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=rife-ncnn-vulkan-git
pkgver=20210227.r0.g6e0d8b2
pkgrel=1
pkgdesc="RIFE, Real-Time Intermediate Flow Estimation for Video Frame Interpolation implemented with ncnn library."
arch=('x86_64' 'i686')
url="https://github.com/nihui/rife-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'libwebp')
makedepends=('git' 'cmake' 'glslang-git' 'vulkan-headers' 'ncnn')
provides=("rife-ncnn-vulkan")
conflicts=("rife-ncnn-vulkan" "rife-ncnn-vulkan-bin")
source=('git+https://github.com/nihui/rife-ncnn-vulkan.git')
md5sums=('SKIP')

pkgver() {
    git -C ${pkgname%-git} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    sed -i 's|path_t model = PATHSTR("rife-HD")|path_t model = PATHSTR("/usr/share/rife-ncnn-vulkan/rife-HD")|' "${pkgname%-git}"/src/main.cpp

    sed -i 's|return get_executable_directory() + path;|return "/usr/share/rife-ncnn-vulkan/" + path;|' "${pkgname%-git}"/src/filesystem_utils.h
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
    for f in rife*/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/rife-ncnn-vulkan/"$f"
    done
}
