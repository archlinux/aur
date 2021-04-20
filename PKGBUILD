# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=cain-ncnn-vulkan
pkgver=20210210
pkgrel=1
pkgdesc="CAIN, Channel Attention Is All You Need for Video Frame Interpolation implemented with ncnn library"
arch=('x86_64')
url="https://github.com/nihui/cain-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'libwebp')
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers' 'ncnn')
provides=("cain-ncnn-vulkan")
conflicts=("cain-ncnn-vulkan-git" "cain-ncnn-vulkan-bin")
source=("https://github.com/nihui/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('620a4f773eea24b1d2e7d9bf8985e75c5fb9cd29ddf2b8a367e26a68b5334497')

 prepare() {
 	sed -i 's|path_t model = PATHSTR("cain")|path_t model = PATHSTR("/usr/share/cain-ncnn-vulkan/cain/")|' "${pkgname}-${pkgver}"/src/main.cpp
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
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${pkgname}/LICENSE
	
    cd "${srcdir}/${pkgname}/models/"
    for f in cain/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/${pkgname}/cain/"$f"
    done
}
