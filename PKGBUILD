# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set the web view provider: either webkit, webengine, auto or none
_webview_provider=${TAGEDITOR_WEBVIEW_PROVIDER:-webengine}

# set the JavaScript provider: either script, qml, auto or none
_js_provider=${TAGEDITOR_JS_PROVIDER:-qml}

# whether the experimental JSON export is enabled: ON or OFF
_json_export=${TAGEDITOR_JSON_EXPORT:-ON}

_reponame=tageditor
pkgname=tageditor-git
_name=${pkgname%-git}
pkgver=995.8e8b986
pkgrel=1
pkgdesc='A tag editor with Qt GUI and command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska'
arch=('x86_64')
url="https://github.com/Martchus/${_reponame}"
license=('GPL-2.0-or-later')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'qt6-base'
    'hicolor-icon-theme'
)
makedepends=(
    'clang'
    'cmake'
    'git'
    'c++utilities-git'
    'qtutilities-git'
    'tagparser-git'
    'ninja'
    'qt6-tools'
    'qt6-declarative'
)
checkdepends=(
  'cppunit'
  'jq'
)
[[ $_webview_provider == none ]] && [[ $_js_provider == none ]] && depends+=('qt6-base')
[[ $_webview_provider == webkit ]] && depends+=('qt6-webkit')
[[ $_webview_provider == webengine ]] && depends+=('qt6-webengine')
[[ $_js_provider == script ]] && depends+=('qt6-script')
[[ $_js_provider == qml ]] && depends+=('qt6-declarative')
[[ $_json_export == ON ]] && makedepends+=('reflective-rapidjson-git')
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
        -D QT_PACKAGE_PREFIX=Qt6
        -D BUILTIN_TRANSLATIONS=ON
        -D BUILTIN_TRANSLATIONS_OF_QT=OFF
        -D WEBVIEW_PROVIDER="${_webview_provider}"
        -D JS_PROVIDER="${_js_provider}"
        -D ENABLE_JSON_EXPORT="${_json_export}"
        -D REFLECTION_GENERATOR_EXECUTABLE:FILEPATH='/usr/bin/reflective_rapidjson_generator-git'
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
        'libqtutilities-git.so'
        'libtagparser-git.so'
        'libc++utilities-git.so'
    )

    DESTDIR="${pkgdir}" cmake --install build
}
