# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=leatherman
pkgver=0.11.1
pkgrel=1
pkgdesc="Collection of C++ and CMake utility libraries"
arch=('i686' 'x86_64')
url="https://github.com/puppetlabs/leatherman"
license=('APACHE')
makedepends=('boost' 'cmake' 'rapidjson')
checkdepends=('ruby')
source=($pkgname-$pkgver.tar.gz::https://github.com/puppetlabs/leatherman/archive/$pkgver.tar.gz
        ruby-2.4.patch)
md5sums=('d4533726589e89f3aae20df027cd1ea3'
         'eb63e7694bd15e779ddc7b146adaad90')

prepare() {
  cd $pkgname-$pkgver

  # Ruby 2.3 fix: replace rb_data_object_alloc symbol with rb_data_object_wrap
  sed -i 's/rb_data_object_alloc/rb_data_object_wrap/g' \
    $( grep -rl rb_data_object_alloc ruby )

  # (LTH-124) Fix for ruby-2.4 related API changes
  patch -p1 -i ../ruby-2.4.patch
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
