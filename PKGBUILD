# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>
# Contributor: Peter Mattern <pmattern at arcor dot de>

_pkgname=libfm-qt6
pkgname=$_pkgname-git
pkgver=1.3.0.8.gda59254
pkgrel=1
pkgdesc='Qt port of libfm, a library providing components to build desktop file managers'
arch=('x86_64')
url='https://github.com/lxqt/libfm-qt'
license=('LGPL')
depends=('qt6-base' 'menu-cache' 'libexif' 'lxqt-menu-data-git')
makedepends=('git' 'cmake' 'qt6-tools' 'lxqt-build-tools-qt6-git')
optdepends=(
  'gvfs: support for the trash bin and network devices'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::'git+https://github.com/lxqt/libfm-qt.git#branch=wip_qt6')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:-:.:g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ../$_pkgname

  make
}

package() {
  cd build

  make DESTDIR="$pkgdir" install

  # CMake installs empty folders unexpectedly
  # https://gitlab.kitware.com/cmake/cmake/issues/17122
  rmdir "$pkgdir"/usr/include/libfm-qt6/{tests,translations}
}
