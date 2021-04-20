# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=dain-ncnn-vulkan
pkgver=20210210
pkgrel=1
pkgdesc="DAIN, Depth-Aware Video Frame Interpolation implemented with ncnn library"
arch=('x86_64')
url="https://github.com/nihui/dain-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'libwebp')
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers' 'vulkan-icd-loader' 'ncnn-git' 'libwebp')
provides=("dain-ncnn-vulkan")
conflicts=("dain-ncnn-vulkan-git" "dain-ncnn-vulkan-bin")
source=("https://github.com/nihui/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('924c58dcec60b9f1fc7e2fe94401ba9ca51767349917d34cb22fb90619d2223b')


prepare() {
 	sed -i 's|path_t model = PATHSTR("best")|path_t model = PATHSTR("/usr/share/dain-ncnn-vulkan/best/")|' "${pkgname%-git}-${pkgver}"/src/main.cpp
 }

build() {
    cmake -B build -S "${pkgname%-git}-${pkgver}"/src \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGLSLANG_TARGET_DIR=/usr/lib/cmake \
        -DUSE_SYSTEM_NCNN=on \
        -DUSE_SYSTEM_WEBP=on
    cmake --build build
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" build/${pkgname%-git}
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${pkgname%-git}/LICENSE
	
    cd "${srcdir}/${pkgname%-git}/models/"
    for f in best/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/${pkgname%-git}/best/"$f"
    done
}
