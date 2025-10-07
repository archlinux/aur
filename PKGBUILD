pkgname=zp-cpp
pkgver=0.14.0
pkgrel=1
pkgdesc='C++ utility and Vulkan abstraction library'
arch=('x86_64')
url='https://github.com/zacharypepin/zp_cpp'
license=('ZLIB')
depends=('glfw' 'vulkan-icd-loader' 'openssl' 'enet')
makedepends=('cmake' 'ninja' 'gtest' 'glm' 'vulkan-headers')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zacharypepin/zp_cpp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8d4e9342ef1af066edf97171624daa4d53122efa8e0c0bb6a6d45b754f181439')

build() {
    local sourcedir="${srcdir}/zp_cpp-${pkgver}/zp_cpp"
    local builddir="${srcdir}/build"

    cmake \
        -S "${sourcedir}" \
        -B "${builddir}" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=ON

    cmake --build "${builddir}"
}

check() {
    local builddir="${srcdir}/build"
    
    echo "Running tests..."
    ctest --test-dir "${builddir}" --output-on-failure
}

package() {
    local builddir="${srcdir}/build"
    DESTDIR="${pkgdir}" cmake --install "${builddir}"

    install -Dm644 "${srcdir}/zp_cpp-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
