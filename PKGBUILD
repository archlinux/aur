# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=passwordfile
pkgname=passwordfile-git
_name=${pkgname%-git}
pkgver=171.0f11c17
pkgrel=2
pkgdesc='C++ library to read/write passwords from/to encrypted files using AES-256-CBC via OpenSSL'
arch=('x86_64')
url="https://github.com/Martchus/${_reponame}"
license=('GPL-2.0-or-later')
depends=(
    'c++utilities-git'
    'glibc'
    'libgcc'
    'libstdc++'
    'openssl'
    'zlib'
)
makedepends=(
    'cmake'
    'git'
    'ninja'
)
checkdepends=(
    'cppunit'
)
optdepends=(
    "$_name-doc: for API documentation"
)
provides=(
    'libpasswordfile-git.so'
)
source=("${_reponame}::${MARTCHUS_GIT_URL_PREFIX:-git+https://github.com/Martchus}/${_reponame}.git")
sha256sums=('SKIP')

pkgver() {
    echo "$(git -C "${_reponame}" rev-list --count HEAD).$(git -C "${_reponame}" rev-parse --short HEAD)"
}

build() {
    local cmake_options=(
        -B build
        -S "${PROJECT_DIR_NAME:-$_reponame}"
        -G Ninja
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BUILD_SHARED_LIBS=ON
        -D CONFIGURATION_NAME:STRING='git'
        -D CONFIGURATION_PACKAGE_SUFFIX:STRING='-git'
        -D CONFIGURATION_TARGET_SUFFIX:STRING='git'
        -D USE_LIBARCHIVE=ON
    )
    cmake "${cmake_options[@]}"
    cmake --build build --target all
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

package() {
    depends+=(
        'libc++utilities-git.so'
        'libcrypto.so'
        'libz.so'
    )

    DESTDIR="${pkgdir}" cmake --install build
}
