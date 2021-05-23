# Maintainer: Jean-Claude Graf <jeanggi90[at]gmail[dot]com>

pkgname=exiv2-pre
pkgver=0.27.4_RC3
pkgrel=1
pkgdesc="Exif, Iptc and XMP metadata manipulation library and tools (prerelease)"
url="https://github.com/Exiv2/exiv2"
arch=('x86_64')
license=('GPL2')
depends=('gcc-libs' 'zlib' 'expat' 'gettext' 'curl')
makedepends=('git' 'cmake' 'gtest')
provides=('exiv2' 'libexiv2.so')
conflicts=('exiv2')
source=("${url}/archive/v${pkgver//_/-}/${pkgname}-${pkgver//_/-}.tar.gz")
md5sums=('f40776ceaf4c665c9aca43c00a8f8d2a')
sha256sums=('8d209bb645d8fb4dae2d880326d00afa6b0e37ae353d47e8d4344c01a2031780')

build() {
  cd "${pkgname//-pre/}-${pkgver//_/-}"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DEXIV2_BUILD_SAMPLES=ON \
    -DEXIV2_BUILD_UNIT_TESTS=ON \
    -DEXIV2_ENABLE_VIDEO=ON \
    -DEXIV2_ENABLE_NLS=ON \
    -DEXIV2_ENABLE_XMP=ON \
    -DEXIV2_ENABLE_CURL=ON \
    -DEXIV2_ENABLE_WEBREADY=ON \
    -DEXIV2_ENABLE_BMFF=ON
  make -C build VERBOSE=1
}

check() {
  cd "${pkgname//-pre/}-${pkgver//_/-}"
  make -C build tests
}

package() {
  cd "${pkgname//-pre/}-${pkgver//_/-}"
  # remove samples instal which are only needed for unit tests
  sed '/samples\/cmake_install.cmake/d' -i build/cmake_install.cmake
  make -C build DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
