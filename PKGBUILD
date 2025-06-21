# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=extra-cmake-modules-git
pkgver=6.16.0.r3803.d42a5482
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
  'qt5-tools'
  'qt5-base'
  'qt5-declarative'
)
conflicts=('extra-cmake-modules')
provides=("extra-cmake-modules=${pkgver%%.r*}")
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

build() {
  cmake -S extra-cmake-modules -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_QTHELP_DOCS=ON \
    -DBUILD_TESTING=OFF

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
