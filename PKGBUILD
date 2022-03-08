# Maintainer: pingplug < aur at pingplug dot me >

_commit=9b6ebd6e43e03be461c5eab803a74786319a14db
_pkgname=SOEM

pkgname=soem
pkgver=1.4.0.r61.g9b6ebd6
pkgrel=2
pkgdesc="Simple Open EtherCAT Master Library"
arch=('x86_64')
url="https://openethercatsociety.github.io/doc/soem"
license=('GPL2')
makedepends=('cmake' 'git')
depends=()
source=("git+https://github.com/OpenEtherCATsociety/SOEM.git#commit=${_commit}"
"fix-scatech.patch")
sha256sums=('SKIP'
            'a3755e1a5f371bae982b4c36b5a3df0d1ff6d38c2f31b1b70326e5b8343050fe')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${srcdir}"
  patch -Np0 -i fix-scatech.patch
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
}
