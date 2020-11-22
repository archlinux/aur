# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=libplacebo
pkgname=lib32-$_pkgbasename
pkgver=2.72.2
pkgrel=1
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
        'lib32-libglvnd'
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
 #   "vulkan-get-rid-of-deprecated-enum-members.patch::https://code.videolan.org/videolan/libplacebo/-/commit/45e19e7bbbbfceb197d8826c775e16ef536a4565.patch"
  )
sha512sums=(
    '0cb100350dbc81566a8363b0265bf89de8569b0313d1f1aa8ba621e39d7ee43a47ec9ab7827d01fdd2133c357983002412e67c2b2ba3616bd570f16e8e3ba135'
#    'SKIP'
  )

prepare() {
  cd ${_pkgbasename}-v${pkgver}

  # Patching if needed
#  patch -Np1 < ../vulkan-get-rid-of-deprecated-enum-members.patch # commit 45e19e7b
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
