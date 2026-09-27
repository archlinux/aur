# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=tagparser
pkgname=tagparser-git
_name=${pkgname%-git}
pkgver=905.8e7f0ff
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
    'c++utilities-git'
    'cmake'
    'git'
    'iso-codes'
    'ninja'
)
checkdepends=(
    'cppunit'
    'openssl'
)
optdepends=(
    "$_name-doc: for API documentation"
)
provides=(
    'libtagparser-git.so'
)
source=("${_reponame}::${MARTCHUS_GIT_URL_PREFIX:-git+https://github.com/Martchus}/${_reponame}.git")
sha256sums=('SKIP')

pkgver() {
    echo "$(git -C "${_reponame}" rev-list --count HEAD).$(git -C "${_reponame}" rev-parse --short HEAD)"
}

prepare() {
  [[ -d tagparser ]] || ln -s "${PROJECT_DIR_NAME:-$_reponame-$pkgver}" tagparser
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
    )
    cmake "${cmake_options[@]}"
    cmake --build build --target all
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

package() {
    depends+=(
        'libc++utilities-git.so'
        'libz.so'
    )

    DESTDIR="${pkgdir}" cmake --install build
}
