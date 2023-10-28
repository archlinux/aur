# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=breeze-icons-git
pkgver=5.240.0.r2054.bf0bb880
pkgrel=1
pkgdesc='Breeze icon themes for KDE Plasma. (GIT version)'
arch=('any')
url='https://quickgit.kde.org/?p=breeze-icons.git'
license=('LGPL')
groups=('kf6')
makedepends=(
  'extra-cmake-modules-git'
  'cmake'
  'git'
  'qt6-tools'
  'python'
  'python-lxml'
)
checkdepends=('fdupes')
provides=('breeze-icons')
conflicts=('breeze-icons')
source=('git+https://invent.kde.org/frameworks/breeze-icons.git')
sha256sums=('SKIP')

pkgver(){
  cd breeze-icons
  _ver="$(cat CMakeLists.txt | grep -m1 'KF_VERSION' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cmake -S breeze-icons -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_CMAKEPACKAGEDIR=/usr/share/cmake \
    -DBUILD_TESTING=ON \
    -DBINARY_ICONS_RESOURCE=ON \
    -DBUILD_WITH_QT6=ON # this is not need at all

  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
