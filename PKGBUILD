# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=contour
pkgver=0.3.10.257
pkgrel=1
pkgdesc="Modern C++ Terminal Emulator"
arch=(x86_64 aarch64)
url="https://github.com/contour-terminal/contour"
license=('Apache-2.0')
depends=('harfbuzz' 'fontconfig' 'yaml-cpp' 'qt5-base' 'qt5-multimedia' 'qt5-x11extras')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja' 'libxml2'
             'python' 'catch2' 'range-v3' 'fmt' 'microsoft-gsl')
source=("https://github.com/contour-terminal/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('455ea99906dbf7a069323ec7d04a2f7ee061fe23f4e0ae47286357909244c8d8adc42fe43da6d30d1bc01e475191fc2c73239d0a04c33aa08a1a831eb1985393')

build() {
  _cpuCount=$(grep -c -w ^processor /proc/cpuinfo)

  CFLAGS=${CFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  # Fetch embedded dependencies
  PREPARE_ONLY_EMBEDS=ON OS_OVERRIDE=arch "./${pkgname}-${pkgver}/scripts/install-deps.sh"

  cmake -S"${pkgname}-${pkgver}" -Bbuild \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCONTOUR_BUILD_WITH_QT6=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel $_cpuCount
}

check() {
  # for running tests, it is (currently) expected to be executed
  # from within the source code's project root directory, in order to
  # access some test files.
  cd "${srcdir}/${pkgname}-${pkgver}"

  "${srcdir}"/build/src/contour/contour version
  "${srcdir}"/build/src/crispy/crispy_test
  "${srcdir}"/build/src/vtbackend/terminal_test
}

package() {
  DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
