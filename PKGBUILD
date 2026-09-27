# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set whether the Qt Quick GUI should be enabled: set to either ON or OFF
_quick_gui=${PASSWORD_MANAGER_QUICK_GUI:-ON}

_reponame=passwordmanager
pkgname=passwordmanager-git
_name=${pkgname%-git}
pkgver=514.12790ad
pkgrel=1
pkgdesc='A simple password store using AES-256-CBC encryption via OpenSSL'
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
    'passwordfile-git'
    'ninja'
    'qt6-tools'
    'qt6-declarative'
)
[[ $_quick_gui == ON ]] && depends+=('qt6-declarative')
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
        -D QUICK_GUI="$_quick_gui"
        -D QUICK_GUI_CONTROLS_STYLE=dynamic
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    depends+=(
        'libqtutilities-git.so'
        'libpasswordfile-git.so'
        'libc++utilities-git.so'
    )

    DESTDIR="${pkgdir}" cmake --install build
}
