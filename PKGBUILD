# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=libplacebo
pkgname=lib32-$_pkgbasename
pkgver=1.21.0
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (32bit)'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=(
        "$_pkgbasename"
        'lib32-vulkan-icd-loader'
        'lib32-glslang>=7.13.3496'
        'lib32-lcms2'
        'lib32-shaderc'
        )
makedepends=(
        'meson'
        'ninja'
        'vulkan-headers'
        )
provides=('libplacebo.so')
source=("https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/${_pkgbasename}-v${pkgver}.tar.gz")
sha512sums=('5de95b8cc48ba4ec9bc3afb8c8f2c4fae0d53ce6e69ffb53884c3a3ee2580998bae46b8934e462740b6c9c2e66e3c5d5f009f9b0f8ad2cb7b4fba829891cf333')

prepare() {
  cd ${_pkgbasename}-v${pkgver}

  # Patching if needed
}

build() {
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  CXXFLAGS+=" -I/usr/include/glslang"

  cd ${_pkgbasename}-v${pkgver}
  arch-meson build \
    --libdir=/usr/lib32 \
    -D tests=true \
    -D vulkan=enabled \
    -D glslang=enabled \
    -D shaderc=enabled \
    -D lcms=enabled
  ninja -C build
}

check() {
  cd ${_pkgbasename}-v${pkgver}
#  ninja -C build test
}

package() {
  cd ${_pkgbasename}-v${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  rm -rf "$pkgdir"/usr/{include,share,bin}
}
