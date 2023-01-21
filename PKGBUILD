# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Christian Rebischke <chris.rebischke at archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

pkgname=leatherman
pkgver=1.12.9
pkgrel=2
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
        librapidjson-1.1.patch
        1.12.4-shared_nowide.patch)

sha512sums=('e69f2b0c04a1cbd20e097abcc020e7b27fb74f168207fcbcffce9fd0edd1760acc75d5c5f645d3a798f106e129ce73e512f0c11699733475b290dfc876de0565'
            'bf05009e466ea62282a78c16fe23e8cfacfbb6e5da9fdf118bf7b1b257a3b48c5c5665ef080bfdf12c9088cb4e180358d11a5bd05e2e658bdbe8f35e0bba4969'
            '1f95d6e0ac1000d2eb8cdfee6184ca74d2bb96a9dec50cdd1539cb7e3060decbf1e4863fa2594ce1cf3405b1edf270b94b82f1c9ca79aaeb6f32f11d10c7eece')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Ruby 2.3 fix: replace rb_data_object_alloc symbol with rb_data_object_wrap
  sed -i 's/rb_data_object_alloc/rb_data_object_wrap/g' \
    $( grep -rl rb_data_object_alloc ruby)

  patch -Np1 < ../librapidjson-1.1.patch
  # Boost 1.74 provides nowide, and since leatherman vendors nowide it has to be patched out.
  patch -Np1 < ../1.12.4-shared_nowide.patch
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
