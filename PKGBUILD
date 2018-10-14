# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=folly
pkgver=2018.10.08.00
pkgrel=2
pkgdesc="An open-source C++ library developed and used at Facebook"
arch=(x86_64)
url="https://github.com/facebook/folly"
license=('Apache')
depends=('snappy' 'jemalloc' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'boost>=1.51.0')
makedepends=('cmake' 'gcc')
source=("https://github.com/facebook/$pkgname/archive/v${pkgver}.tar.gz"
'gtest-1.7.0.zip::https://github.com/google/googletest/archive/release-1.7.0.zip'
'jemalloc.patch'
)
md5sums=('ef6b83f8eb5e9f1333a8c18ae13ead0c'
         'ef5e700c8a0f3ee123e2e0209b8b4961'
         '699ebfe2dfa70964bff5f5e461ce4fa9')

prepare() {
  cd "$pkgname-$pkgver"
  patch folly/experimental/JemallocHugePageAllocator.cpp < $srcdir/jemalloc.patch
  mkdir -p _build
  cd _build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  ln -sf $srcdir/googletest-release-1.7.0 gtest-1.7.0
}

build() {
  cd "$pkgname-$pkgver"
  cmake --build _build
}

check() {
  cd "$pkgname-$pkgver/_build"
}

package() {
  cd "$pkgname-$pkgver/_build"
  make DESTDIR="$pkgdir/" install
}
