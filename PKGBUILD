# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ksystemlog-frameworks-git
pkgver=0.4.r225.c061909
pkgrel=1
pkgdesc='KDE SystemLog Application. KF5 Frameworks branch. (GIT version)'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdeadmin/ksystemlog'
license=(GPL)
depends=('kio')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('kdeadmin-ksystemlog' 'ksystemlog')
provides=('kdeadmin-ksystemlog' 'ksystemlog')
source=('git://anongit.kde.org/ksystemlog.git#branch=frameworks')
sha256sums=('SKIP')
install=ksystemlog-frameworks-git.install

pkgver() {
  cd ksystemlog
  _ver="$(cat src/main.cpp | grep -m3 QStringLiteral | tail -n1 | cut -d '"' -f2)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ksystemlog \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
