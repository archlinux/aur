# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=cpp-taskflow
pkgver=1.0.2
pkgrel=1
pkgdesc="Fast C++ Parallel Programming with Task Dependencies"
arch=('any')
url="https://github.com/cpp-taskflow/cpp-taskflow"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/cpp-taskflow/cpp-taskflow/archive/v${pkgver}.tar.gz")
sha256sums=('b27de9728a116efcdb5dda23e70d0151751a97fa17155297f2c26f386c8debf4')

prepare() {
    cd "${pkgname}-${pkgver}"
    echo "install(FILES taskflow.hpp DESTINATION include)" >> CMakeLists.txt
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
}
