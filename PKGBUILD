# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=folly
pkgver=0.41.0
pkgrel=1
pkgdesc="An open-source C++ library developed and used at Facebook"
arch=(x86_64)
url="https://github.com/facebook/folly"
license=('Apache')
depends=('snappy' 'jemalloc' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'boost')
makedepends=('python2')
source=("https://github.com/facebook/$pkgname/archive/v${pkgver}.tar.gz"
'https://googletest.googlecode.com/files/gtest-1.7.0.zip'
)
md5sums=('d7ff7682850ea0846881fb1fb42136e9'
         '2d6ec8ccdf5c46b05ba54a9fd1d130d7')

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
  ln -sf $srcdir/gtest-1.7.0 .
}

build() {
	cd "$pkgname-$pkgver/$pkgname"
	CFLAGS="$CFLAGS -fpermissive" CXXFLAGS="$CXXFLAGS -fpermissive" \
  LIBS=-latomic ./configure --prefix=/usr --disable-static
  make
}

check() {
	cd "$pkgname-$pkgver/$pkgname"
	CFLAGS=-fpermissive make check
}

package() {
	cd "$pkgname-$pkgver/$pkgname"
	make DESTDIR="$pkgdir/" install
}
