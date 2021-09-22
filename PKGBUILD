# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=libplacebo
pkgname=lib32-$_pkgbasename
pkgver=4.157.0
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (32bit)'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=(
        "$_pkgbasename>=${pkgver}"
#        "$_pkgbasename"
        'lib32-vulkan-icd-loader>=1.2.176'
        'lib32-glslang>=8.13.3559'
        'lib32-lcms2'
        'lib32-shaderc'
        'lib32-libepoxy'
        'lib32-libglvnd'
        'lib32-glibc'
        'lib32-gcc-libs'
        )
makedepends=(
        'meson'
#        'meson-cross-x86-linux-gnu>=1.0.4'
        'ninja'
        'vulkan-headers'
        'python'
        'python-mako'
        )
provides=('libplacebo.so')
source=(
    "https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/${_pkgbasename}-v${pkgver}.tar.gz"
  )
sha512sums=(
    'efa909fe8e6f053322bdda64834038218ee313e7df7f6f03d049b38318f1627543b60d4902f968c67dd00ece4db0c8d2eb20e3dc7a43dd05a16700723cba1d5f'
  )
b2sums=(
    '32b348bee195e95f503cea3cc26a7de18e8c40ea793c70649a6d1dea157ab233c2422cdf8d84b8449bce4594e4457a30753f51b1c38a76b3199769616ffa65c5'
  )

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
    -D demos=false \
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
