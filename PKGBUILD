# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: neodarz <neodarz@neodarz.net>

pkgname=libsavitar
pkgver=5.3.0
pkgrel=0.2
pkgdesc="C++ implementation of 3mf loading with SIP python bindings"
arch=('x86_64')
url="https://github.com/Ultimaker/libsavitar"
license=('AGPL')
depends=('python' 'pugixml')
makedepends=(
  'cmake'
  'ninja'
  'python-pyqt5-sip'
  'sip'
  'git'
)
checkdepends=('gtest')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/Ultimaker/libSavitar//archive/${pkgver}.tar.gz
  git+https://github.com/Ultimaker/conan-ultimaker-index.git
)
b2sums=(
  'fa9c745c6f86940e87e99b08d7ddbc933fe5e56cac583da9ecb7673efc7ce63de4be9729f4108e1de9867bd1d4cad311da6c2c3707d9ab075dcf873cc41a0bad'
  "SKIP"
)

prepare() {
  cd "libSavitar-${pkgver}"
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages,DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages,g' CMakeLists.txt
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages/cura),DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/cura),g' CMakeLists.txt
  sed -i 's/option(ENABLE_TESTING "Enable unit-testing" OFF)/option(ENABLE_TESTING "Enable unit-testing" ON)/g' CMakeLists.txt

  cd ${srcdir}/conan-ultimaker-index/recipes/standardprojectsettings/all
  mv StandardProjectSettings.cmake standardprojectsettingsConfig.cmake
}

build() {
  cd libSavitar-${pkgver}
  mkdir  build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_PREFIX_PATH=../conan-ultimaker-index/recipes/standardprojectsettings/all \
    -Wno-dev
  make
}

check() {
    ctest --test-dir "libSavitar-${pkgver}/build" --output-on-failure --stop-on-failure
}

package() {
  cd libSavitar-${pkgver}
  # license
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # headers
  install -D -m644 include/Savitar/*.h -t "${pkgdir}/usr/include/Savitar"
  # lib
  install -D -m644 build/*.so -t "${pkgdir}/usr/lib"
}
