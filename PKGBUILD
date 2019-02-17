# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=cpp-taskflow
pkgver=2.1.0
pkgrel=1
pkgdesc="Modern C++ Parallel Task Programming Library"
arch=('any')
url="https://github.com/cpp-taskflow/cpp-taskflow"
license=('MIT')
makedepends=('cmake')
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('479ffd7b1fbeeca98b25cda254158b09adc6733c4c4f955b757580d70f002c5b')

prepare() {
    cd "${pkgname}-${pkgver}"
    #echo "install(FILES taskflow.hpp DESTINATION include)" >> CMakeLists.txt
}

build() {
    cd "${pkgname}-${pkgver}"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DTF_BUILD_EXAMPLES=OFF

    cmake --build build
}

check() {
    cd "${pkgname}-${pkgver}"
    cmake --build build -- test
}

package() {
    cd "${pkgname}-${pkgver}"
    cmake --build build -- DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -a example "${pkgdir}/usr/share/${pkgname}/"
}
