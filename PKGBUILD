# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=dian-ncnn-vulkan
pkgname=dain-ncnn-vulkan-git
pkgver=r21.79257cd
pkgrel=1
pkgdesc="DAIN, Depth-Aware Video Frame Interpolation implemented with ncnn library"
arch=('x86_64' 'i686')
url="https://github.com/nihui/dain-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'libwebp')
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers' 'vulkan-icd-loader' 'ncnn-git' 'libwebp')
provides=("dian-ncnn-vulkan")
conflicts=("dian-ncnn-vulkan")
source=('git+https://github.com/nihui/dain-ncnn-vulkan.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/dain-ncnn-vulkan"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

 prepare() {
	cd "${srcdir}/dain-ncnn-vulkan"
 	sed -i 's|depthnet.load_param("depthnet.param");|depthnet.load_param("/usr/share/dain-ncnn-vulkan/best/depthnet.param");|' src/dain.cpp
 	sed -i 's|depthnet.load_model("depthnet.bin");|depthnet.load_model("/usr/share/dain-ncnn-vulkan/best/depthnet.bin");|' src/dain.cpp
 	sed -i 's|flownet.load_param("flownet.param");|flownet.load_param("/usr/share/dain-ncnn-vulkan/best/flownet.param");|' src/dain.cpp
 	sed -i 's|flownet.load_model("flownet.bin");|flownet.load_model("/usr/share/dain-ncnn-vulkan/best/flownet.bin");|' src/dain.cpp
 	sed -i 's|ctxnet.load_param("ctxnet.param");|ctxnet.load_param("/usr/share/dain-ncnn-vulkan/best/ctxnet.param");|' src/dain.cpp
	sed -i 's|ctxnet.load_model("ctxnet.bin");|ctxnet.load_model("/usr/share/dain-ncnn-vulkan/best/ctxnet.bin");|' src/dain.cpp
	sed -i 's|interpolation.load_param("interpolation.param");|interpolation.load_param("/usr/share/dain-ncnn-vulkan/best/interpolation.param");|' src/dain.cpp
	sed -i 's|interpolation.load_model("interpolation.bin");|interpolation.load_model("/usr/share/dain-ncnn-vulkan/best/interpolation.bin");|' src/dain.cpp
 }

build() {
	cd "${srcdir}/dain-ncnn-vulkan"
	mkdir -p build
	cd build
	cmake -DUSE_SYSTEM_NCNN=ON -DUSE_SYSTEM_WEBP=ON -DGLSLANG_TARGET_DIR="/usr/lib/cmake/" ../src
    make
}

package() {
	cd "${srcdir}/dain-ncnn-vulkan"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	install -Dm755 "${srcdir}/dain-ncnn-vulkan/build/dain-ncnn-vulkan" "${pkgdir}/usr/bin/dain-ncnn-vulkan"
	
    cd "${srcdir}/dain-ncnn-vulkan/models/"
    for f in best/*; do
        install -Dm 644 "$f" ${pkgdir}/usr/share/dain-ncnn-vulkan/"$f"
    done
}
