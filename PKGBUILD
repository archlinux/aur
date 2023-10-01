# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=extra-cmake-modules-git
pkgver=5.240.0.r3626.319d0260
pkgrel=1
pkgdesc='Extra modules and scripts for CMake. (GIT version)'
arch=('any')
url='https://projects.kde.org/projects/kdesupport/extra-cmake-modules'
license=('LGPL')
groups=('kf6')
depends=('cmake')
makedepends=(
  'git'
  'python-sphinx'
  'python-requests'
)
checkdepends=(
  'reuse'
  'qt6-tools'
  'qt6-base'
  'qt6-declarative'
)
conflicts=('extra-cmake-modules')
provides=('extra-cmake-modules')
optdepends=(
 'python-pyxdg: to generate fastlane metadata for Android apps'
 'python-requests: to generate fastlane metadata for Android apps'
 'python-yaml: to generate fastlane metadata for Android apps'
 'clang: for clang support'
)
source=('git+https://invent.kde.org/frameworks/extra-cmake-modules.git')
sha256sums=('SKIP')

pkgver() {
  cd extra-cmake-modules
  _ver="$(cat CMakeLists.txt | grep -m1 'set(VERSION' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed 's|frameworks/||g' -i extra-cmake-modules/tests/KDEFetchTranslations/CMakeLists.txt
}

build() {
  cmake -S extra-cmake-modules -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_QTHELP_DOCS=ON \
    -DBUILD_TESTING=ON \
    -DQT_MAJOR_VERSION=6

  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure -E ECMPoQmToolsTest
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
