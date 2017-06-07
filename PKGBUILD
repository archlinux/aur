# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=folly
pkgver=2017.06.05.00
pkgrel=2
pkgdesc="An open-source C++ library developed and used at Facebook"
arch=(x86_64)
url="https://github.com/facebook/folly"
license=('Apache')
depends=('snappy' 'jemalloc' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'boost>=1.51.0')
makedepends=('python2' 'gcc5')
source=("https://github.com/facebook/$pkgname/archive/v${pkgver}.tar.gz"
'gtest-1.7.0.zip::https://github.com/google/googletest/archive/release-1.7.0.zip'
)
md5sums=('a25e8d646702c3e0c1400f591e485a33'
         'ef5e700c8a0f3ee123e2e0209b8b4961')

prepare() {
  cd "$pkgname-$pkgver/$pkgname"
  autoreconf -ivf
  cd build
  for i in *.py; do
    sed --in-place -e '1s/python/python2/g' "$i"
  done
  cd ..
  [ ! -d test ] && mkdir test
  cd test
  ln -sf $srcdir/googletest-release-1.7.0 gtest-1.7.0
}

build() {
  cd "$pkgname-$pkgver/$pkgname"
  CFLAGS="$CFLAGS -fpermissive" CXXFLAGS="$CXXFLAGS -fpermissive" \
  LIBS=-latomic CC=gcc-5 CXX=g++-5 ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd "$pkgname-$pkgver/$pkgname"
#  CFLAGS=-fpermissive make check
#  make check
}

package() {
  cd "$pkgname-$pkgver/$pkgname"
  make DESTDIR="$pkgdir/" install
}
