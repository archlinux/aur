# Maintainer: Jean-Claude Graf <jeanggi90[at]gmail[dot]com>

pkgname=exiv2-git
pkgver=0.27.4.RC2.r247.gc7a41230f
pkgrel=2
pkgdesc="Exif, Iptc and XMP metadata manipulation library and tools"
url="https://github.com/Exiv2/exiv2"
arch=('x86_64')
license=('GPL2')
depends=('gcc-libs' 'zlib' 'expat' 'gettext' 'curl')
makedepends=('git' 'cmake' 'gtest')
provides=('exiv2' 'libexiv2.so')
conflicts=('exiv2')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
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
    -DEXIV2_ENABLE_WEBREADY=ON
  make -C build VERBOSE=1
}

package() {
  cd "$pkgname"
  # remove samples instal which are only needed for unit tests
  sed '/samples\/cmake_install.cmake/d' -i build/cmake_install.cmake
  make -C build DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
