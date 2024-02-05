# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=contour
pkgver=0.4.3.6442
pkgrel=1
pkgdesc="Modern C++ Terminal Emulator"
arch=(x86_64 aarch64)
url="https://github.com/contour-terminal/contour"
license=('Apache-2.0')
depends=('harfbuzz' 'fontconfig' 'yaml-cpp' 'qt6-base' 'qt6-declarative' 'qt6-multimedia'
         'qt6-shadertools' 'qt6-wayland' 'qt6-5compat' 'libutempter')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja' 'libxml2'
             'python' 'range-v3' 'fmt' 'microsoft-gsl' 'catch2')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f0a91fbd5abefbbac0f785bb8f454759568e3daadbad6ff1ade00fccf8b0af94f16747816598c706a698d65ce884a2e9499512942e6f22263ebc654ae6fb6879')

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
        -DCONTOUR_QT_VERSION=6 \
        -DCONTOUR_TESTING=ON
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
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" cmake --build . --target install

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
