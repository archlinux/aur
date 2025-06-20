pkgname=vkpeak
pkgver=20250531
pkgrel=1
pkgdesc="A tool which profiles Vulkan devices to find their peak capacities"
arch=('x86_64')
url="https://github.com/nihui/vkpeak"
license=('MIT')
source=("${pkgname}::git+https://github.com/nihui/vkpeak.git#tag=${pkgver}"
        "ncnn::git+https://github.com/Tencent/ncnn.git")
depends=('vulkan-icd-loader')
makedepends=('cmake' 'glslang' 'ninja' 'protobuf' 'vulkan-headers')
sha256sums=('SKIP' 'SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule."ncnn".url "${srcdir}/ncnn"
    git -c protocol.file.allow=always submodule update --init --recursive
}
build(){
    cd "${srcdir}/${pkgname}"

    rm -rf build
    mkdir build

    cd build
    cmake ..
    cmake --build . -j $(nproc)
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/vkpeak/LICENSE
    install -Dm755 build/vkpeak "${pkgdir}/usr/bin/vkpeak"
}
