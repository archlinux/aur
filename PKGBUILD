# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=libplacebo-git
pkgver=v1.18.0.20.g22a9919
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives. (GIT version)'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=('vulkan-icd-loader'
         'lcms2'
         'libshaderc_shared.so'
         )
makedepends=('git'
             'meson'
             'ninja'
             'vulkan-headers'
             )
provides=('libplacebo'
          'libplacebo.so'
          )
conflicts=('libplacebo'
           'libplacebo.so'
           )
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
