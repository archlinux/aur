# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: tobias <tobias@arhlinux.org>

_name="exiv2"
pkgname="lib32-${_name}"
pkgver=0.28.5
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
sha512sums=('43c1d68255ee8df124b3093e1f4101d2f55fd8d6105bb6f20b148fe7d59472b895f0cba914e59f6d1581e84eee9d7033572821b80c16507e92abcb9a738daadc')
b2sums=('71975428aeb397233627cc49563d2bf8405bf4a2d46fff4e078a9bb0ce0d0b400590a673acd98c4390bf50d1acb8371029b5e872ddae6aa79022497161455eaa')

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
