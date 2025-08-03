# Maintainer: pingplug < aur at pingplug dot me >

_commit=304d1c05eab77dc0d426f1a5cf09c8cc7dc03713
_pkgname=SOEM

pkgname=soem
pkgver=2.0.0.r0.g304d1c0
pkgrel=3
pkgdesc="Simple Open EtherCAT Master Library"
arch=('x86_64')
url="https://openethercatsociety.github.io/doc/soem"
license=('GPL-3.0-only')
makedepends=('cmake' 'git')
depends=()
source=("git+https://github.com/OpenEtherCATsociety/SOEM.git#commit=${_commit}")
options=('!lto')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${srcdir}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=on
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  DESTDIR="${pkgdir}" make install
  cd "${pkgdir}"
  # scripts
  mv usr/scripts/* usr/bin
  rmdir usr/scripts
  # cmake
  install -dm755 usr/lib/cmake/${pkgname}
  mv usr/cmake/* usr/lib/cmake/${pkgname}
  rmdir usr/cmake
  # licenses
  install -dm755 usr/share/licenses/${pkgname}
  mv usr/LICENSE.md usr/share/licenses/${pkgname}
  rm usr/README.md
}
