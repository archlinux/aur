# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=dav1d
pkgname=lib32-$_pkgbasename
pkgver=0.7.0
pkgrel=1
pkgdesc='AV1 cross-platform decoder focused on speed and correctness (32 bit)'
url='https://code.videolan.org/videolan/dav1d/'
arch=('x86_64')
license=('BSD')
depends=(
      "$_pkgbasename"
      'lib32-glibc'
      'lib32-vulkan-icd-loader'
      )
makedepends=(
      'meson'
#      'meson-cross-x86-linux-gnu'
      'ninja'
      'nasm'
      'doxygen'
      'vulkan-headers'
      )
provides=('libdav1d.so')
source=(
      "https://downloads.videolan.org/pub/videolan/${_pkgbasename}/${pkgver}/${_pkgbasename}-${pkgver}.tar.xz"
      "https://downloads.videolan.org/pub/videolan/${_pkgbasename}/${pkgver}/${_pkgbasename}-${pkgver}.tar.xz.sha256sum"
      )
sha512sums=(
      'a2c6981ba5ad5ffe8382e32d6afb943fdd3ee2801751e4d84718171ccaeeef28ae4822b2ae282b301f4806351526cd83aa72b2535fa3a99ec534996458508521'
      'SKIP'
      )
validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key

prepare() {
  cd ${_pkgbasename}-${pkgver}

  # Patching if needed
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS} -I/usr/include/glslang"

  cd ${_pkgbasename}-${pkgver}
  arch-meson build \
    --prefix=/usr \
    --libdir=lib32 \
    -D enable_tests=false

# Options disabled
#     --cross-file x86-linux-gnu \ ## Meson doesn't use the system's LDFLAGS with cross-file yet...

  ninja -C build
}

check() {
  cd ${_pkgbasename}-${pkgver}/build
#  meson test
}

package() {
  cd ${_pkgbasename}-${pkgver}

  DESTDIR="${pkgdir}" ninja -C build install
  rm -r "$pkgdir"/usr/{include,bin}
}
