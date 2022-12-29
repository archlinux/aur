# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=contour
pkgver=0.3.9.250
pkgrel=1
pkgdesc="Modern C++ Terminal Emulator"
arch=(x86_64 aarch64)
url="https://github.com/contour-terminal/contour"
license=('Apache-2.0')
depends=('fontconfig')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'python3' 'microsoft-gsl' 'fmt' 'ninja' 'qt5-base' 'qt5-declarative' 'qt5-multimedia' 'harfbuzz' 'fontconfig' 'catch2' 'range-v3' 'yaml-cpp')
source=("https://github.com/contour-terminal/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('473bd92530635464c5f15ede4f14bf299dbb86de806d67bc2e86a45f49717bfe76ef6be817ddc4c47b5c45ad890e6125c43575bb59f8feeca2ed61c0e9c6e348')
provides=('contour')
conflicts=('contour')
options=('!strip' 'debug')

build() {
  _cpuCount=$(grep -c -w ^processor /proc/cpuinfo)

  CFLAGS=${CFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  # Fetch embedded dependencies
  PREPARE_ONLY_EMBEDS=ON "./${pkgname}-${pkgver}/scripts/install-deps.sh"

  cmake -S"${pkgname}-${pkgver}" -Bbuild \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCONTOUR_BUILD_WITH_QT6=OFF \
        -DYAML_BUILD_SHARED_LIBS=OFF -DYAML_CPP_BUILD_CONTRIB=OFF \
        -DYAML_CPP_BUILD_TESTS=OFF -DYAML_CPP_BUILD_TOOLS=OFF \
        -DYAML_CPP_INSTALL=OFF \
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
