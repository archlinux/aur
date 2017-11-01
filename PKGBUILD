# Maintainer: Jose Rafael Castillo Huggins <jrch2k10@gmail.com>
# Contributor: Jose Rafael Castillo Huggins <jrch2k10@gmail.com>

pkgbase=evpp-git
pkgname=('evpp-git' 'evpp-benchmark-git' 'evmc-git' 'evnsq-git')
pkgdesc="EVPP trunk (git version)"
pkgver=1094.8e808d19
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('cmake' 'libevent' 'google-glog' 'gtest' 'gflags' 'boost' 'boost-libs' 'thrift')
url="https://github.com/Qihoo360/evpp"
license=('BSD-3')
source=('evpp-git::git+https://github.com/Qihoo360/evpp.git')
options=('!libtool' '!debug')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/evpp-git
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd ${srcdir}/evpp-git
  git submodule update --init --recursive 
}

build() {
  cd ${srcdir}/evpp-git
  mkdir -p build
  cd ${srcdir}/evpp-git/build
  cmake -DBUILD_SHARED_LIBS=true -DCMAKE_BUILD_TYPE=Release ..
  make
  make test
  mkdir -p $srcdir/fakeinstall
  make DESTDIR=${srcdir}/fakeinstall install
}

package_evpp-git() {
  pkgdesc="modern C++ network library for developing high performance network services (git version)"
  depends=('libevent' 'google-glog' 'gtest' 'gflags' 'boost' 'boost-libs' 'thrift')
  optdepends=('gtest' 'gflags' 'boost' 'boost-libs' 'thrift')
  provides=('evpp-git')

  install -m755 -d ${pkgdir}/usr/include
  mv -v ${srcdir}/fakeinstall/usr/local/include/evpp ${pkgdir}/usr/include

  install -m755 -d ${pkgdir}/usr/lib
  mv -v ${srcdir}/fakeinstall/usr/local/lib/libevpp*.so* ${pkgdir}/usr/lib

  install -m755 -d "${pkgdir}/usr/share/licenses/evpp-git"
  install -m644 "${srcdir}/evpp-git/LICENSE" "${pkgdir}/usr/share/licenses/evpp-git/"
}

package_evpp-benchmark-git() {
  pkgdesc="nonblocking async C++ client library for memcached and membase (git version)(benchmark suite)"
  depends=("evpp-git=${pkgver}" 'libevent' 'google-glog')
  provides=('evmc-git')

  install -m755 -d ${pkgdir}/usr/share/evpp/benchmarks/bin
  mv -v ${srcdir}/evpp-git/build/bin/benchmark* ${pkgdir}/usr/share/evpp/benchmarks/bin
}

package_evmc-git(){
  pkgdesc="nonblocking async C++ client library for memcached and membase (git version)"
  depends=("evpp-git=${pkgver}" 'libevent' 'google-glog')
  provides=('evmc-git')

  install -m755 -d ${pkgdir}/usr/include
  mv -v ${srcdir}/fakeinstall/usr/local/include/evmc ${pkgdir}/usr/include

  install -m755 -d ${pkgdir}/usr/lib
  mv -v ${srcdir}/fakeinstall/usr/local/lib/libevmc*.so* ${pkgdir}/usr/lib
}

package_evnsq-git(){
  pkgdesc="nonblocking async C++ client library for NSQ (git version)"
  depends=("evpp-git=${pkgver}" 'libevent' 'google-glog')
  provides=('evnsq-git')

  install -m755 -d ${pkgdir}/usr/include
  mv -v ${srcdir}/fakeinstall/usr/local/include/evnsq ${pkgdir}/usr/include

  install -m755 -d ${pkgdir}/usr/lib
  mv -v ${srcdir}/fakeinstall/usr/local/lib/libevnsq*.so* ${pkgdir}/usr/lib
}

