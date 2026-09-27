# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# A minimal version of tageditor which has only the CLI enabled and no JSON export
# by default.

# whether the experimental JSON export is enabled: ON or OFF
_json_export=${TAGEDITOR_JSON_EXPORT:-OFF}

_reponame=tageditor
pkgname=tageditor-cli
pkgver=3.9.11
pkgrel=2
pkgdesc='A tag editor with command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska (GUI disabled)'
arch=('x86_64')
url="https://github.com/Martchus/${_reponame}"
license=('GPL-2.0-or-later')
depends=(
    'c++utilities'
    'tagparser'
)
makedepends=(
    'cmake'
    'ninja'
)
checkdepends=(
    'cppunit'
)
conflicts=("${pkgname%-cli}")
provides=("${pkgname%-cli}")
[[ $_json_export == ON ]] && makedepends+=('reflective-rapidjson')
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('ccb04b41cae2455852839bdaef94456fadc4254619b97a8736f71a0b031dcffe')

prepare() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
}

build() {
    local cmake_options=(
        -B build
        -S "${PROJECT_DIR_NAME:-$pkgbase-$pkgver}"
        -G Ninja
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BUILD_SHARED_LIBS=ON
        -D QT_PACKAGE_PREFIX=Qt6
        -D BUILTIN_TRANSLATIONS=ON
        -D BUILTIN_TRANSLATIONS_OF_QT=OFF
        -D WIDGETS_GUI=OFF
        -D QUICK_GUI=OFF
        -D ENABLE_JSON_EXPORT="${_json_export}"
        -D REFLECTION_GENERATOR_EXECUTABLE:FILEPATH='/usr/bin/reflective_rapidjson_generator'
    )
    cmake "${cmake_options[@]}"
    cmake --build build
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
        'libc++utilities.so'
        'libtagparser.so'
    )

    DESTDIR="${pkgdir}" cmake --install build
}
