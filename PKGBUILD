# Maintainer: Christian Rebischke <chris.rebischke at archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

pkgname=leatherman
pkgver=1.6.0
pkgrel=1
pkgdesc="Collection of C++ and CMake utility libraries"
arch=('x86_64')
url="https://github.com/puppetlabs/leatherman"
license=('APACHE')
makedepends=('boost' 'cmake' 'rapidjson')
checkdepends=('ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/puppetlabs/leatherman/archive/${pkgver}.tar.gz")
sha512sums=('d0d22b60db2c164183268d29fe1bc1ee9ed16797d38174849eaa74841f801869d038e5672664aae89517487811a70f689a345a2c87d3a2f0a04d55214e7f9eaa')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Ruby 2.3 fix: replace rb_data_object_alloc symbol with rb_data_object_wrap
  sed -i 's/rb_data_object_alloc/rb_data_object_wrap/g' \
    $( grep -rl rb_data_object_alloc ruby )
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
