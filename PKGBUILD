# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=qtforkawesome
pkgname=qtforkawesome-git
_name=${pkgname%-git}
pkgver=115.8fc8c7c
pkgrel=2
_pkgver_fork_awesome=1.2.0
pkgdesc='Library that bundles ForkAwesome for use within Qt applications'
arch=('x86_64')
url="https://github.com/Martchus/${_reponame}"
license=('GPL-2.0-or-later')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'qt6-base'
    'qt6-declarative'
)
makedepends=(
    'cmake'
    'git'
    'ninja'
    'perl-yaml-libyaml'
    'qt6-tools'
    'qtutilities-git'
)
optdepends=(
    'qt6-declarative: Qt Quick integration'
    "$_name-doc: API documentation"
)
provides=(
    'libqtforkawesome-git.so'
    'libqtquickforkawesome-git.so'
)
source=("${_reponame}::${MARTCHUS_GIT_URL_PREFIX:-git+https://github.com/Martchus}/${_reponame}.git"
        "Fork-Awesome-${_pkgver_fork_awesome}.tar.gz::https://github.com/ForkAwesome/Fork-Awesome/archive/refs/tags/${_pkgver_fork_awesome}.tar.gz")
sha256sums=('SKIP'
            '23fba5f191f204e0414c547bf4c9b10fd7ca42c151260e8f64698449a75fbdb3')

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
        -D CONFIGURATION_NAME:STRING='git'
        -D CONFIGURATION_PACKAGE_SUFFIX:STRING='-git'
        -D CONFIGURATION_TARGET_SUFFIX:STRING='git'
        -D FORK_AWESOME_FONT_FILE="${srcdir}/Fork-Awesome-${_pkgver_fork_awesome}/fonts/forkawesome-webfont.woff2"
        -D FORK_AWESOME_ICON_DEFINITIONS="${srcdir}/Fork-Awesome-${_pkgver_fork_awesome}/src/icons/icons.yml"
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
    QT_QPA_PLATFORM=offscreen ctest "${ctest_flags[@]}"
}

package() {
  depends+=(
      'libc++utilities-git.so'
      'libqtutilities-git.so'
  )
  DESTDIR="${pkgdir}" cmake --install build
}
