# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=contour
pkgver=0.3.11.258
pkgrel=2
pkgdesc="Modern C++ Terminal Emulator"
arch=(x86_64 aarch64)
url="https://github.com/contour-terminal/contour"
license=('Apache-2.0')
depends=('harfbuzz' 'fontconfig' 'yaml-cpp' 'qt6-base' 'qt6-multimedia' 'qt6-5compat')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja' 'libxml2'
             'python' 'catch2' 'range-v3' 'fmt' 'microsoft-gsl')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('96e6ec683df18b0b15bee4bcbe68bc940b025d99466bf278b7f356acd27f054e9c49376f20545aef0a619c0bcd65c961a22c58f37b2e6011fe2d2a9bc65ef1b7')

build() {
  _cpuCount=$(grep -c -w ^processor /proc/cpuinfo)

  CFLAGS=${CFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  # Fetch embedded dependencies
  PREPARE_ONLY_EMBEDS=ON OS_OVERRIDE=arch ${pkgname}-${pkgver}/scripts/install-deps.sh

  cmake -S"${pkgname}-${pkgver}" -Bbuild \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCONTOUR_BUILD_WITH_QT6=ON
  cmake --build build --parallel $_cpuCount
}

check() {
  # for running tests, it is (currently) expected to be executed
  # from within the source code's project root directory, in order to
  # access some test files.
  cd "${srcdir}/${pkgname}-${pkgver}"

  "${srcdir}"/build/src/contour/contour version
  "${srcdir}"/build/src/crispy/crispy_test
  "${srcdir}"/build/src/vtparser/vtparser_test
  "${srcdir}"/build/src/vtbackend/vtbackend_test
}

package() {
  DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
