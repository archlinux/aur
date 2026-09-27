# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgbase=tagparser
pkgname=("${pkgbase}" "${pkgbase}-doc")
_reponame=tagparser
pkgver=12.5.3
pkgrel=2
pkgdesc='C++ library for reading and writing MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska tags'
arch=('x86_64')
url="https://github.com/Martchus/${_reponame}"
license=('GPL-2.0-or-later')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'zlib'
)
makedepends=(
    'c++utilities'
    'cmake'
    'doxygen'
    'graphviz'
    'iso-codes'
    'ninja'
)
checkdepends=(
    'cppunit'
    'openssl'
)
optdepends=(
    "$pkgname-doc: API documentation"
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('902ba1759ed54cff5e5009d6d4d1dded9ee0bd0d23fb1221aef59adf25b0e455')

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
    if ! [[ $TEST_FILE_PATH ]]; then
      msg2 'Skipping execution of testsuite because the environment variable TEST_FILE_PATH is not set.'
      return 0
    fi

    cmake --build build --target tests

    local ctest_flags=(
        --test-dir build
        --output-on-failure
        --parallel $(nproc)
    )
    ctest "${ctest_flags[@]}"
}

package_tagparser() {
    depends+=(
        'libc++utilities.so'
        'libz.so'
    )
    optdepends=("${pkgbase}-doc: for API documentation")
    provides=('libtagparser.so')

    DESTDIR="${pkgdir}" cmake --install build
    rm -rf "${pkgdir}/usr/share/${pkgbase}/api-doc"
}

package_tagparser-doc() {
    pkgdesc+=" - API documentation"
    depends=()

    DESTDIR="${pkgdir}" cmake --build build --target install-api-doc
}
