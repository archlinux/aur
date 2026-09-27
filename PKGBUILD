# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=passwordfile
pkgbase=passwordfile
pkgname=("${pkgbase}" "${pkgbase}-doc")
pkgver=5.2.1
pkgrel=2
pkgdesc='C++ library to read/write passwords from/to encrypted files using AES-256-CBC via OpenSSL'
arch=('x86_64')
url="https://github.com/Martchus/${_reponame}"
license=('GPL-2.0-or-later')
depends=(
    'c++utilities'
    'glibc'
    'libgcc'
    'libstdc++'
    'openssl'
    'zlib'
)
makedepends=(
    'cmake'
    'doxygen'
    'graphviz'
    'ninja'
)
checkdepends=(
    'cppunit'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('5308d03ffa53760cce55baceb37686411548363b22460ead9d41aaf0b2045fa7')

build() {
    local cmake_options=(
        -B build
        -S "${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
        -G Ninja
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BUILD_SHARED_LIBS=ON
    )
    cmake "${cmake_options[@]}"
    cmake --build build --target all apidoc
}

check() {
    cmake --build build --target tests

    local ctest_flags=(
        --test-dir build
        --output-on-failure
        --parallel $(nproc)
    )
    ctest "${ctest_flags[@]}"
}

package_passwordfile() {
    depends+=(
        'libc++utilities.so'
        'libcrypto.so'
        'libz.so'
    )
    optdepends=("${pkgbase}-doc: for API documentation")
    provides=('libpasswordfile.so')

    DESTDIR="${pkgdir}" cmake --install build
    rm -rf "${pkgdir}/usr/share/${pkgbase}/api-doc"
}

package_passwordfile-doc() {
    pkgdesc+=" - API documentation"
    depends=()

    DESTDIR="${pkgdir}" cmake --build build --target install-api-doc
}
