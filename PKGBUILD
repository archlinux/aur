# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=libplacebo
pkgname=lib32-$_pkgbasename
pkgver=4.208.0
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
    '5d4b9a9d61dcd61c716bf9bbb22b9a0976f5d42069a46993da9b9b5625a6c75c352b353f74ec74f80f91f6bb1acb96dd7809d36e80ad1a8e64aab62d07107ffa'
  )
b2sums=(
    '1ad2b10f007dc26b51621dc54b93f1d9d4dd970b79181dee6a3ce103b5fccf4cabfdbb2b446084c18e5e80b4f22b137d8a05efd5f857513f1fbe3d9b6af4e3bb'
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
