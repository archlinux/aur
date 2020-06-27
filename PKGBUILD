# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildbox-common
pkgver=0.0.11.r0.gc696992
pkgrel=1
pkgdesc="Shared protocol-buffer definitions and various helper functions"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('grpc' 'gtest' 'gmock')
makedepends=('cmake' 'git')
_commit=c69699234660e418274e9f4a50f4558c446fda1e # tag 0.0.11
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-common#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # https://gitlab.com/BuildGrid/buildbox/buildbox-common/-/issues/71
  sed -i 's#O_WRONLY);#O_WRONLY, S_IRUSR|S_IWUSR);#' $pkgname/buildbox-common/buildboxcommon/buildboxcommon_systemutils.cpp
}

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname             \
    -DCMAKE_BUILD_TYPE=Release  \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd build
  make -k test
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
