# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=googletest
pkgver=1.10.0
pkgrel=1
pkgdesc="Google Testing and Mocking Framework"
arch=('i686' 'x86_64')
url="https://github.com/google/googletest"
license=('BSD')
provides=('gmock'
          'gtest')
conflicts=('gmock'
           'gtest')
depends=('sh')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/googletest/archive/release-${pkgver}.tar.gz")
sha256sums=('9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb')

build() {
  cd "${pkgname}-release-${pkgver}"
  rm -rf build
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -Dgtest_build_samples=ON \
        -Dgtest_build_tests=ON \
        -Dgmock_build_tests=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON \
        ..
  make
}

package() {
  cd "${pkgname}-release-${pkgver}"
  make -C build DESTDIR="${pkgdir}/" install
  install -Dm755 googletest/scripts/gtest-config.in "${pkgdir}/usr/bin/gtest-config"
  install -Dm755 googlemock/scripts/gmock-config.in "${pkgdir}/usr/bin/gmock-config"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/src/googletest/googletest"
  cp -R googletest/src "${pkgdir}/usr/src/googletest/googletest"
  install -d "${pkgdir}/usr/src/googletest/googlemock"
  cp -R googlemock/src "${pkgdir}/usr/src/googletest/googlemock"
}