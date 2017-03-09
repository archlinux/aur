# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=folly
pkgver=2017.03.06.00
pkgrel=1
pkgdesc="An open-source C++ library developed and used at Facebook"
arch=(x86_64)
url="https://github.com/facebook/folly"
license=('Apache')
depends=('snappy' 'jemalloc' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'boost>=1.51.0')
makedepends=('python2')
source=("https://github.com/facebook/$pkgname/archive/v${pkgver}.tar.gz"
'gtest-1.7.0.zip::https://github.com/google/googletest/archive/release-1.7.0.zip'
)
md5sums=('67e9c744be9e48f10c83b56d2710dc29'
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
  LIBS=-latomic ./configure --prefix=/usr --disable-static
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
