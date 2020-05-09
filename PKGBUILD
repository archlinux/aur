# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=libplacebo
pkgname=lib32-$_pkgbasename
pkgver=2.43.1
pkgrel=2
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (32bit)'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=(
        "$_pkgbasename"
        'lib32-vulkan-icd-loader'
        'lib32-glslang>=8.13.3559'
        'lib32-lcms2'
        'lib32-shaderc'
        'lib32-libepoxy'
        )
makedepends=(
        'meson'
#        'meson-cross-x86-linux-gnu>=1.0.4'
        'ninja'
        'vulkan-headers'
        )
provides=('libplacebo.so')
source=("https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/${_pkgbasename}-v${pkgver}.tar.gz")
sha512sums=('62463dfee6e6fd450395e42d7af2b6e0caa0b183c0d00f5ba0c5ddc893a47cdd0371d37fc72a7361228324b0dc9c55dd0309a5a7210cf753618fde18a094abcb')

prepare() {
  cd ${_pkgbasename}-v${pkgver}

  # Patching if needed
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS} -I/usr/include/glslang"
 
  cd ${_pkgbasename}-v${pkgver}
  meson build \
    --prefix=/usr \
    --libdir=lib32 \
    -D tests=false \
    -D vulkan=enabled \
    -D glslang=enabled \
    -D shaderc=enabled \
    -D lcms=enabled

#    --cross-file x86-linux-gnu \

  ninja -C build -v
}

check() {
  cd ${_pkgbasename}-v${pkgver}
#  ninja -C build test
}

package() {
  cd ${_pkgbasename}-v${pkgver}

  DESTDIR="${pkgdir}" ninja -C build install
#  mv "${pkgdir}"/usr/lib "${pkgdir}"/usr/lib32

  rm -r "${pkgdir}"/usr/include
}
