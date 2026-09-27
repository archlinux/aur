# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=syncthingtray
pkgname=syncthingtray-git
_name=${pkgname%-git}
pkgver=3672.a2576bb4
pkgrel=1
pkgdesc='Tray application for Syncthing'
arch=('x86_64')
url="https://github.com/Martchus/${_reponame}"
license=('GPL-2.0-or-later')
depends=(
    'glibc'
    'hicolor-icon-theme'
    'libgcc'
    'libstdc++'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qt6-webengine'
)
optdepends=(
    'syncthing: for managing a local Syncthing instance'
    'gnome-shell-extension-appindicator: tray icon support for GNOME Shell'
)
makedepends=(
    'boost'
    'boost-libs'
    'c++utilities-git'
    'cmake'
    'git'
    'extra-cmake-modules'
    'kdeclarative'
    'libplasma'
    'ninja'
    'qt6-tools'
    'qt6-webengine'
    'qtforkawesome-git'
    'qtutilities-git'
    'perl'
    'python-myst-parser'
)
checkdepends=(
    'cppunit'
    'iproute2'
    'syncthing'
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
        -D QT_PACKAGE_PREFIX=Qt6
        -D KF_PACKAGE_PREFIX=KF6
        -D BUILTIN_TRANSLATIONS=ON
        -D BUILTIN_TRANSLATIONS_OF_QT=OFF
        -D WEBVIEW_PROVIDER=webengine
        -D JS_PROVIDER=qml
        -D QUICK_GUI=ON
        -D QUICK_GUI_CONTROLS_STYLE=dynamic
        -D SYSTEMD_SUPPORT=ON
    )
    cmake "${cmake_options[@]}"
    cmake --build build --target all sphinxdoc
}

check() {
    cmake --build build --target tests

    # https://github.com/syncthing/syncthing/issues/8785
    export HOME="$(mktemp -p "$PWD" -d testhome.XXX)"
    # https://github.com/Martchus/syncthingtray/issues/455
    export QT_QPA_PLATFORM=offscreen QT_QPA_PLATFORMTHEME=
    local _ephemeral_port=$(comm -23 <(seq 49152 65535) <(ss -Htan | awk '{print $4}' | awk -F':' '{print $NF}' | grep -E '^[0-9]+$' | sort -u) | shuf -n 1)
    export SYNCTHING_PORT=${_ephemeral_port}
    export SYNCTHING_TEST_TIMEOUT_FACTOR=3
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
        'libqtforkawesome-git.so'
        'libc++utilities-git.so'
        'libboost_filesystem.so'
    )

    DESTDIR="${pkgdir}" cmake --install build
}
