# Maintainer: Christian Rebischke <chris.rebischke at archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

pkgname=leatherman
pkgver=1.12.0
pkgrel=1
pkgdesc="Collection of C++ and CMake utility libraries"
arch=('x86_64')
url="https://github.com/puppetlabs/leatherman"
license=('APACHE')
depends=('boost-libs' 'libcurl.so' 'icu' 'gcc-libs' 'glibc')
makedepends=('boost' 'cmake' 'rapidjson' 'python')
checkdepends=('ruby')
optdepends=('python: cpplint cmake script')
provides=(
  leatherman_curl.so
  leatherman_dynamic_library.so
  leatherman_execution.so
  leatherman_file_util.so
  leatherman_json_container.so
  leatherman_locale.so
  leatherman_logging.so
  leatherman_ruby.so
  leatherman_util.so
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/puppetlabs/leatherman/archive/${pkgver}.tar.gz"
        librapidjson-1.1.patch)
sha512sums=('2ceb16f94bf3d06bfe477a40e15db5a1d3d3999eaa7023245a08ab4e0054179f28308d9bf6ba73a839ca3a68130259894593fc8e77664b672ac5f3d20511a4d2'
            'bf05009e466ea62282a78c16fe23e8cfacfbb6e5da9fdf118bf7b1b257a3b48c5c5665ef080bfdf12c9088cb4e180358d11a5bd05e2e658bdbe8f35e0bba4969')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Ruby 2.3 fix: replace rb_data_object_alloc symbol with rb_data_object_wrap
  sed -i 's/rb_data_object_alloc/rb_data_object_wrap/g' \
    $( grep -rl rb_data_object_alloc ruby)

  patch -Np1 < ../librapidjson-1.1.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  # Work around hang in leatherman_test
  CXXFLAGS+=' -fno-strict-overflow'

  mkdir -p build
  cd build

  cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DENABLE_CXX_WERROR=OFF \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DLEATHERMAN_SHARED=ON \
    -DLEATHERMAN_USE_ICU=ON \
    ..
  make
}

check() {
  cd "${pkgname}-${pkgver}"/build

  make test
}

package() {
  cd "${pkgname}-${pkgver}"

  make -C build install DESTDIR="${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
