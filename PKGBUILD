# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ksystemlog-git
pkgver=0.4.r318.d276659
pkgrel=1
pkgdesc='KDE SystemLog Application. (GIT version)'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdeadmin/ksystemlog'
license=(GPL)
depends=('kio')
makedepends=('extra-cmake-modules'
             'git'
             'kdoctools'
             'python'
             )
conflicts=('kdeadmin-ksystemlog'
           'ksystemlog'
           'ksystemlog-frameworks-git')
provides=('ksystemlog')
source=('git://anongit.kde.org/ksystemlog.git')
sha1sums=('SKIP')
install=ksystemlog-git.install

pkgver() {
  cd ksystemlog
  _ver="$(cat src/main.cpp | grep -m2 QStringLiteral | tail -n1 | cut -d '"' -f6)"
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
