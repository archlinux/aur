# Maintainer: Jean-Claude Graf <jeanggi90[at]gmail[dot]com>

pkgname=exiv2-pre
pkgver=0.27.4
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
md5sums=('ecabc1459a7d70f91799735ed7d8a80c')
sha256sums=('9fb2752c92f63c9853e0bef9768f21138eeac046280f40ded5f37d06a34880d9')

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
