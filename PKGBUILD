# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=libplacebo
pkgname=lib32-$_pkgbasename
pkgver=3.104.0
#3.120.0 pkgver=3.120.0
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (32bit)'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=(
        "$_pkgbasename=${pkgver}"
#3.120.0        "$_pkgbasename"
        'lib32-vulkan-icd-loader'
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
    "vulkan-blacklist-fuchsia-strings.patch::https://code.videolan.org/videolan/libplacebo/-/commit/ac44e8f14acbfd2810c46e07e38466673f0ad7e0.patch" #fixed under 3.120.0
  )
sha512sums=(
  '896ade7d87fe02924cbf5a0f2b39a2054c8b9eb7a5f0adf574d0ec3dc9239020f8c69450501775002f7697250da595bf24a7d2d7039eb396073411c6fce2edfb'
  'SKIP'
#3.120.0    '78d917c4d258db4597431cda315626f66dccb664cf6a88ec23d7e7dc22f7bd70f8d1bf61a706d7dfa61fb2766520c97703570ed1d75b3980014afdf8dbac9a4b'
  )
b2sums=(
  'dfd743470eb679ddf14b517f856dec1a1df1df88788d8222aade4b31f8d625c66a6bfeb0ff95df2eec531fa6950d68b3ca578cb244104a2591090ad8dcbca6a8'
  'SKIP'
#3.120.0    '97549b721884b5c79fea30ad12e51968f66e4dcd399842d5445af1f90c7e3ae5530bae14c7ab63ae7c0d86aca2090e3c1fdd8baab59852c6ecbfdb6da02cdaa3'
  )

prepare() {
  cd ${_pkgbasename}-v${pkgver}

  # Patching if needed
  patch -Np1 < ../vulkan-blacklist-fuchsia-strings.patch # commit ac44e8f14acbfd2810c46e07e38466673f0ad7e0
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
