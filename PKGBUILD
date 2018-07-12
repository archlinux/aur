# Maintainer: Christian Rebischke <chris.rebischke at archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

pkgname=leatherman
pkgver=1.4.1
pkgrel=2
pkgdesc="Collection of C++ and CMake utility libraries"
arch=('x86_64')
url="https://github.com/puppetlabs/leatherman"
license=('APACHE')
makedepends=('boost' 'cmake' 'rapidjson')
checkdepends=('ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/puppetlabs/leatherman/archive/${pkgver}.tar.gz")
sha512sums=('71fa4723d231ffd6c582a332d6e57da8d1631d787ac7eeef55a505217b9d216ada11efc2636f2238c0272c30d943c61e1f391941f1c4531f911cce597062ffa6')

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

 Disabled Tests due to infinite loop bug
check() {
  cd "${pkgname}-${pkgver}"

  make test
}

package() {
  cd "${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
