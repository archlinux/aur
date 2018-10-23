# Maintainer: Christian Rebischke <chris.rebischke at archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

pkgname=leatherman
pkgver=1.5.2
pkgrel=1
pkgdesc="Collection of C++ and CMake utility libraries"
arch=('x86_64')
url="https://github.com/puppetlabs/leatherman"
license=('APACHE')
makedepends=('boost' 'cmake' 'rapidjson')
checkdepends=('ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/puppetlabs/leatherman/archive/${pkgver}.tar.gz")
sha512sums=('9cef854fd7a95c54fcfc2e639e469dfaa4625757ea8aceeb9ac2162bfc89cbcbc1d5e8217af5f1fad4f31d98528475e22157ca6b1046a36e0928074f866ddafd')

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
