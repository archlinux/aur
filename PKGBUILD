# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=qtutilities
pkgname=qtutilities-git
_name=${pkgname%-git}
pkgver=732.90e0c5e
pkgrel=2
pkgdesc='Common Qt related C++ classes and routines used by my applications such as dialogs, widgets and models'
arch=('x86_64')
url="https://github.com/Martchus/${_reponame}"
license=('GPL-2.0-or-later')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'libx11'
    'qt6-base'
)
makedepends=(
    'cmake'
    'clang'
    'git'
    'ninja'
    'c++utilities-git'
    'qt6-tools'
    'qt6-declarative'
)
optdepends=(
  "$_name-doc: for API documentation"
)
provides=(
    'libqtutilities-git.so'
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
        -D QT_PACKAGE_PREFIX=Qt6
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BUILD_SHARED_LIBS=ON
        -D BUILTIN_TRANSLATIONS=ON
        -D BUILTIN_TRANSLATIONS_OF_QT=OFF
        -D CONFIGURATION_NAME:STRING='git'
        -D CONFIGURATION_PACKAGE_SUFFIX:STRING='-git'
        -D CONFIGURATION_TARGET_SUFFIX:STRING='git'
    )
    cmake "${cmake_options[@]}"
    cmake --build build --target all

  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCONFIGURATION_NAME:STRING='git' \
    -DCONFIGURATION_PACKAGE_SUFFIX:STRING='-git' \
    -DCONFIGURATION_TARGET_SUFFIX:STRING='git' \
    -DQT_PACKAGE_PREFIX:STRING='Qt6' \
    -DKF_PACKAGE_PREFIX:STRING='KF6' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILTIN_TRANSLATIONS:BOOL=ON \
    .
  ninja
}

check() {
    cmake --build build --target tests

    local ctest_flags=(
        --test-dir build
        --output-on-failure
        --parallel $(nproc)
    )
    export QT_QPA_PLATFORM=offscreen
    ctest "${ctest_flags[@]}"
}

package() {
  depends+=(
      'libc++utilities-git.so'
  )

  DESTDIR="${pkgdir}" cmake --install build
}
