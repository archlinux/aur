# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: tobias <tobias@arhlinux.org>

_name="exiv2"
pkgname="lib32-${_name}"
pkgver=0.28.4
pkgrel=1
pkgdesc="Exif, Iptc and XMP metadata manipulation library and tools (32-bit)"
arch=('x86_64')
url="https://exiv2.org"
_url="https://github.com/Exiv2/${_name}"
license=('GPL-2.0-or-later')
depends=("${_name}>=${pkgver}" 'lib32-brotli' 'lib32-curl' 'lib32-expat'
         'lib32-gcc-libs' 'lib32-glibc' 'lib32-libinih' 'lib32-zlib')
makedepends=('cmake>=3.11')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz")
sha512sums=('2a10a25bd2a6226ecb1faee4fb02bcc9c91143bec73fe9ca5439ce2ed5fe66e68bb407a080916e8902de35efccc904af9eaf83a31a69cfab816adb91fdc0f2a9')
b2sums=('609925c8615ee787f16087065dae503311ce9ca4af89724c6b680ec03f883697a75d0f55297e05d7d17cdda846356d0d8c3b3cf6b6570bd5120fbdc152645030')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DCMAKE_INSTALL_LIBDIR:PATH='/usr/lib32'
    -DCMAKE_SKIP_RPATH=ON
    -DEXIV2_BUILD_SAMPLES=OFF
    -DEXIV2_BUILD_UNIT_TESTS=OFF
    -DEXIV2_ENABLE_VIDEO=ON
    -DEXIV2_ENABLE_NLS=ON
    -DEXIV2_ENABLE_XMP=ON
    -DEXIV2_ENABLE_CURL=ON
    -DEXIV2_ENABLE_WEBREADY=ON
    -DEXIV2_ENABLE_BMFF=ON
    -Wno-dev
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}

# vim: ts=2 sw=2 et:
