# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=libplacebo-git
pkgver=v1.29.1.7.gcf6d9ab
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives. (GIT version)'
url='https://code.videolan.org/videolan/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=('vulkan-icd-loader'
         'lcms2'
         'libshaderc_shared.so'
         'glslang'
         )
makedepends=('git'
             'meson'
             'vulkan-headers'
             )
provides=('libplacebo'
          'libplacebo.so'
          )
conflicts=('libplacebo')
source=('git+https://code.videolan.org/videolan/libplacebo.git')
sha256sums=('SKIP')

pkgver() {
  cd libplacebo
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson ../libplacebo \
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

  install -Dm644 libplacebo/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
