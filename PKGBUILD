# Maintainer: Jitang Zheng <jitang.zheng@gmail.com>
pkgname=fb-folly
pkgver=2016.07.26
pkgrel=3
pkgdesc="An open-source C++ library developed and used at Facebook."
arch=(x86_64)
url="https://github.com/facebook/folly"
license=('Apache')
depends=('snappy' 'jemalloc' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'boost')
makedepends=('python2')
conflicts=('folly')
provides=('folly')
source=("https://github.com/facebook/folly/archive/${pkgver}.tar.gz"
'fiber.patch'
'https://googletest.googlecode.com/files/gtest-1.7.0.zip'
)
md5sums=('74b08d2dad634fb27d4d5ce15a20fd58'
         '7a79d1a967f822a1c2cbc87922aaad43'
         '2d6ec8ccdf5c46b05ba54a9fd1d130d7')

prepare() {
  cd "folly-$pkgver/folly"
  patch -p2 < ../../fiber.patch
  autoreconf -ivf
  cd build
  for i in *.py; do
    sed --in-place -e '1s/python/python2/g' "$i"
  done
  cd ..
  [ ! -d test ] && mkdir test
  cd test
  ln -sf $srcdir/gtest-1.7.0 .
}

build() {
  cd "folly-$pkgver/folly"
  CFLAGS="$CFLAGS -fpermissive" CXXFLAGS="$CXXFLAGS -fpermissive" \
  LIBS=-latomic ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd "folly-$pkgver/folly"
#  CFLAGS=-fpermissive make check
#  make check
}

package() {
  cd "folly-$pkgver/folly"
  make DESTDIR="$pkgdir/" install
}
