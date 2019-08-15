# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=libplacebo
pkgname=lib32-$_pkgbasename
pkgver=1.18.0
pkgrel=2
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (32bit)'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=(
        "$_pkgbasename"
        'lib32-vulkan-icd-loader'
        'lib32-glslang'
        'lib32-lcms2'
        'lib32-shaderc'
        )
makedepends=(
        'meson'
        'ninja'
        'vulkan-headers'
        )
provides=('libplacebo.so')
source=("https://github.com/haasn/libplacebo/archive/v${pkgver}/${_pkgbasename}-${pkgver}.tar.gz")
sha512sums=('3115bbd019f4555340e64590e844de61a5fd4f02392b38a34d69059be79dcaeffc3d74b720568fb2f7f974409a8ff5feff83f7d6b7fdb2228af8761b78395339')

prepare() {
  cd ${_pkgbasename}-${pkgver}

  # Patching if needed
}

build() {
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}-${pkgver}
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
  cd ${_pkgbasename}-${pkgver}
#  ninja -C build test
}

package() {
  cd ${_pkgbasename}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  rm -rf "$pkgdir"/usr/{include,share,bin}
}
