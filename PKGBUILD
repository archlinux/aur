# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=cain-ncnn-vulkan
pkgname=cain-ncnn-vulkan-git
pkgver=r24.9d234b9
pkgrel=1
pkgdesc="CAIN, Channel Attention Is All You Need for Video Frame Interpolation implemented with ncnn library"
arch=('x86_64' 'i686')
url="https://github.com/nihui/cain-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'libwebp')
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers' 'ncnn')
provides=("cain-ncnn-vulkan")
conflicts=("cain-ncnn-vulkan" "cain-ncnn-vulkan-bin")
source=('git+https://github.com/nihui/cain-ncnn-vulkan.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/cain-ncnn-vulkan"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

 prepare() {
	cd "${srcdir}/cain-ncnn-vulkan"
 	sed -i 's|cainnet.load_param("cain.param");|cainnet.load_param("/usr/share/cain-ncnn-vulkan/cain/cain.param");|' src/cain.cpp
 	sed -i 's|cainnet.load_model("cain.bin");|cainnet.load_model("/usr/share/cain-ncnn-vulkan/cain/cain.bin");|' src/cain.cpp
 }

build() {
	cd "${srcdir}/cain-ncnn-vulkan"
	mkdir -p build
	cd build
	cmake -DUSE_SYSTEM_NCNN=ON -DUSE_SYSTEM_WEBP=ON -DGLSLANG_TARGET_DIR="/usr/lib/cmake/" ../src
    make
}

package() {
	cd "${srcdir}/cain-ncnn-vulkan"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	install -Dm755 "${srcdir}/cain-ncnn-vulkan/build/cain-ncnn-vulkan" "${pkgdir}/usr/bin/cain-ncnn-vulkan"
	
    cd "${srcdir}/cain-ncnn-vulkan/models/"
    for f in cain/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/cain-ncnn-vulkan/"$f"
    done
}
