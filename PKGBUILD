# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=leatherman
pkgver=0.9.1
pkgrel=3
pkgdesc="Collection of C++ and CMake utility libraries"
arch=('i686' 'x86_64')
url="https://github.com/puppetlabs/leatherman"
license=('APACHE')
makedepends=('boost' 'cmake' 'rapidjson')
checkdepends=('ruby')
source=($pkgname-$pkgver.tar.gz::https://github.com/puppetlabs/leatherman/archive/$pkgver.tar.gz
        boost-1.62.patch)
md5sums=('ad1c03f759a9451b333c867ec90e4a97'
         '18aeaac44f2b24702f04fb04535d3a3a')

prepare() {
  cd $pkgname-$pkgver

  # Ruby 2.3 fix: replace rb_data_object_alloc symbol with rb_data_object_wrap
  sed -i 's/rb_data_object_alloc/rb_data_object_wrap/g' \
    $( grep -rl rb_data_object_alloc ruby )

  # (LTH-115) Fix Boost.Log sink initialization with Boost 1.62
  patch -Np0 -i ../boost-1.62.patch 
}

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr

  make
}

check() {
  cd $pkgname-$pkgver

  make test
}

package() {
  cd $pkgname-$pkgver

  make install DESTDIR="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
