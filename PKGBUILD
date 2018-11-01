# Maintainer: Christian Rebischke <chris.rebischke at archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

pkgname=leatherman
pkgver=1.5.3
pkgrel=1
pkgdesc="Collection of C++ and CMake utility libraries"
arch=('x86_64')
url="https://github.com/puppetlabs/leatherman"
license=('APACHE')
makedepends=('boost' 'cmake' 'rapidjson')
checkdepends=('ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/puppetlabs/leatherman/archive/${pkgver}.tar.gz")
sha512sums=('e2616a42c6879755f338f9f0291bf28c7465d51caa3326be521ae3e0d5d79e82099c8720dc19223ad9112cde81c4579faf28a2b467f802baefc99dd59212b818')

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
