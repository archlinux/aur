# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=dain-ncnn-vulkan-git
pkgver=20210210.r0.gf29cb02
pkgrel=2
pkgdesc="DAIN, Depth-Aware Video Frame Interpolation implemented with ncnn library"
arch=('x86_64')
url="https://github.com/nihui/dain-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'libwebp')
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers' 'vulkan-icd-loader' 'ncnn-git' 'libwebp')
provides=("dain-ncnn-vulkan")
conflicts=("dain-ncnn-vulkan" "dain-ncnn-vulkan-bin")
source=('git+https://github.com/nihui/dain-ncnn-vulkan.git')
md5sums=('SKIP')

pkgver() {
    git -C ${pkgname%-git} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

 prepare() {
 	sed -i 's|path_t model = PATHSTR("best")|path_t model = PATHSTR("/usr/share/dain-ncnn-vulkan/best/")|' "${pkgname%-git}"/src/main.cpp
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
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${pkgname%-git}/LICENSE
	
    cd "${srcdir}/${pkgname%-git}/models/"
    for f in best/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/${pkgname%-git}/"$f"
    done
}
