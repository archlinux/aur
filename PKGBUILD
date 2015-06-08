# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=qvdpautest-git
pkgver=0.5.2.r29.d4396a3
pkgrel=1
pkgdesc="A VDPAU Benchmark. (GIT version)"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.nvnews.net/vbulletin/showthread.php?p=2015214"
makedepends=('cmake')
depends=('qt4' 'libvdpau')
provides=('qvdpautest')
conflicts=('qvdpautest')
source=('git+https://github.com/robertmassaioli/qvdpautest.git')
sha1sums=('SKIP')
_gitname="qvdpautest"

pkgver() {
  cd qvdpautest
  _ver="$(cat src/Utils.h | grep QVDPAUTEST_VERSION | cut -d ' ' -f4 | tr -d '+' | tr -e -d '\n')"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  sed -e 's| directoryString.append("./");| directoryString.append("/usr/share/qvdpautest/");|g' -i qvdpautest/src/main.cpp
}

build() {
  cd build
  cmake ../qvdpautest \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
