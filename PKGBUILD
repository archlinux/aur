# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=cpp-taskflow
_alt_pkgname=taskflow
pkgver=3.5.0
pkgrel=1
pkgdesc="Modern C++ Parallel Task Programming Library"
arch=('any')
url="https://github.com/taskflow/taskflow"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('33c44e0da7dfda694d2b431724d6c8fd25a889ad0afbb4a32e8da82e2e9c2a92')

prepare() {
    cd "${_alt_pkgname}-${pkgver}"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DTF_BUILD_EXAMPLES=OFF
}

build() {
    cd "${_alt_pkgname}-${pkgver}"
    cmake --build build
}

check() {
    cd "${_alt_pkgname}-${pkgver}/build"
    ctest --output-on-failure
}

package() {
    cd "${_alt_pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
