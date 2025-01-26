# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: tobias <tobias@arhlinux.org>

_name="exiv2"
pkgname="lib32-${_name}"
pkgver=0.28.3
pkgrel=1
pkgdesc="Exif, Iptc and XMP metadata manipulation library and tools (32-bit)"
arch=('x86_64')
url="https://exiv2.org"
_url="https://github.com/Exiv2/${_name}"
license=('GPL-2.0-or-later')
depends=("${_name}>=${pkgver}" 'lib32-brotli' 'lib32-curl' 'lib32-expat'
         'lib32-gcc-libs' 'lib32-glibc' 'lib32-libinih' 'lib32-zlib')
makedepends=('cmake>=3.11')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz")
sha512sums=('c8338a118feefa104d73932890c732247c884ab9ce1d170c43a22ab5884517a0e2a7fd1febde7705b8290fbbbc29e64738610404816e4db2b56a70fc444ca049')
b2sums=('73ebdca376d69514a89261d2f78604c5d7ccbc6e73e5c5d61f8caa596fd6b60dd4d06df19cb9f93e402d9a76f1511955f77cfd74b407310a13952092ecfbf0ef')

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
