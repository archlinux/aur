# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=karchive-git
pkgver=5.79.0.r447.g5745a19
pkgrel=1
pkgdesc='Qt 5 addon providing access to numerous types of archives'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/karchive'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git')
conflicts=(karchive)
provides=(karchive)
source=('git+https://github.com/KDE/karchive.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(cat CMakeLists.txt | grep -m1 'set(KF5_VERSION' | cut -d '"' -f2 | tr - .)"
  echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../karchive \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
