# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=libfm-qt-git
_pkgname=${pkgname%-git}
pkgver=2.1.0
pkgrel=1
pkgdesc='Qt port of libfm, a library providing components to build desktop file managers'
arch=(i686 x86_64)
url='https://lxqt-project.org'
license=('LGPL-2.1-only')
depends=(
  gcc-libs
  glib2
  glibc
  libexif
  libxcb
  lxqt-menu-data-git
  menu-cache
  qt6-base
)
makedepends=(
  cmake
  git
  lxqt-build-tools-git
  qt6-tools
)
optdepends=('gvfs: support for the trash bin and network devices')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" 'pcmanfm-qt<=0.10.0')
source=('git+https://github.com/lxqt/libfm-qt.git')
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}

  git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
  cd ${_pkgname}

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -Wno-dev
  cmake --build build
}

package() {
  cd ${_pkgname}

  DESTDIR="${pkgdir}" cmake --install build

  # CMake installs empty folders unexpectedly
  # https://gitlab.kitware.com/cmake/cmake/issues/17122
  rmdir "${pkgdir}"/usr/include/libfm-qt6/{tests,translations}
}
