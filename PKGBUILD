# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=lib32-libplacebo-git
pkgver=v1.18.0.20.g22a9919
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives. (GIT version)'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=('lib32-vulkan-icd-loader'
         'lib32-lcms2'
         'lib32-shaderc'
         )
makedepends=('git'
             'meson'
             'ninja'
             'vulkan-headers'
             )
provides=('lib32-libplacebo')
conflicts=('lib32-libplacebo')
source=('git+https://github.com/haasn/libplacebo.git')
sha256sums=('SKIP')

pkgver() {
  cd libplacebo
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build
  arch-meson ../libplacebo \
    --libdir=/usr/lib32 \
    -D vulkan=enabled \
    -D glslang=enabled \
    -D shaderc=enabled \
    -D lcms=enabled

  ninja
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  rm -rf "${pkgdir}/usr/include"

  install -Dm644 libplacebo/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
