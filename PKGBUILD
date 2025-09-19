pkgname=vkpeak-git
pkgver=20250531.r5.gc810bd2
pkgrel=1
pkgdesc="A tool which profiles Vulkan devices to find their peak capacities. Git version."
arch=('x86_64')
url="https://github.com/nihui/vkpeak"
license=('MIT')
source=("${pkgname}::git+https://github.com/nihui/vkpeak.git"
        "ncnn::git+https://github.com/Tencent/ncnn.git")
depends=('vulkan-icd-loader' 'gcc-libs' 'glibc')
makedepends=('cmake' 'glslang' 'ninja' 'protobuf' 'vulkan-headers')
sha256sums=('SKIP' 'SKIP')
provides=("vkpeak")
conflicts=('vkpeak')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule."ncnn".url "${srcdir}/ncnn"
    git -c protocol.file.allow=always submodule update --init --recursive
}

build(){
    cd "${srcdir}/${pkgname}"
    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/vkpeak/LICENSE
    install -Dm755 build/vkpeak "${pkgdir}/usr/bin/vkpeak"
}
