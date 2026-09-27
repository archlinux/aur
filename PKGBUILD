# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set whether the Qt Quick GUI should be enabled: set to either ON or OFF
_quick_gui=${PASSWORD_MANAGER_QUICK_GUI:-ON}

_reponame=passwordmanager
pkgname=passwordmanager
pkgver=4.4.2
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
    'c++utilities'
    'qtutilities'
    'passwordfile'
    'ninja'
    'qt6-tools'
    'qt6-declarative'
)
[[ $_quick_gui == ON ]] && depends+=('qt6-declarative')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('af6d6e7bfe931129a4a6aa13c15636cff617c6310d4f2bcb29864712d757b2c0')

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
        -D QUICK_GUI="$_quick_gui"
        -D QUICK_GUI_CONTROLS_STYLE=dynamic
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    depends+=(
        'libc++utilities.so'
        'libpasswordfile.so'
        'libqtutilities.so'
    )
    provides=("${pkgname}-qt6")
    conflicts=("${pkgname}-qt6")
    replaces=("${pkgname}-qt6")

    DESTDIR="${pkgdir}" cmake --install build
}
