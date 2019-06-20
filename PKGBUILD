# Maintainer: Christian Rebischke <chris.rebischke at archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

pkgname=leatherman
pkgver=1.7.0
pkgrel=1
pkgdesc="Collection of C++ and CMake utility libraries"
arch=('x86_64')
url="https://github.com/puppetlabs/leatherman"
license=('APACHE')
makedepends=('boost' 'cmake' 'rapidjson')
checkdepends=('ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/puppetlabs/leatherman/archive/${pkgver}.tar.gz")
sha512sums=('d7a475ecc6bea3e2239482e96c673ca3cded21c4538c9416241f8cf402ab70189cc4e4ff86c5b9daf7d74b864f292feeaf380289b347c54adf8afcf43c83e788')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Ruby 2.3 fix: replace rb_data_object_alloc symbol with rb_data_object_wrap
  sed -i 's/rb_data_object_alloc/rb_data_object_wrap/g' \
    $( grep -rl rb_data_object_alloc ruby)
}

build() {
  cd "${pkgname}-${pkgver}"

  # Do not treat warnings as errors
  CXXFLAGS+=' -Wno-error'

  # Work around hang in leatherman_test
  CXXFLAGS+=' -fno-strict-overflow'

  cmake -DCMAKE_INSTALL_PREFIX=/usr

  make
}

check() {
  cd "${pkgname}-${pkgver}"

  make test
}

package() {
  cd "${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
