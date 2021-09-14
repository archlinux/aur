# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname='libplacebo-git'
pkgver=4.157.0.5.g51b0e24
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives. (GIT version)'
url='https://code.videolan.org/videolan/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
makedepends=('git'
             'meson'
             'ninja'
             'vulkan-headers'
             'python-mako'
             )
depends=('libvulkan.so'
         'liblcms2.so'
         'glslang'
         'libepoxy'
         'glfw'
         'libshaderc_shared.so'
         'libavcodec.so'
         'libavutil.so'
         'libavformat.so'
         )
provides=('libplacebo'
          'libplacebo.so'
          )
conflicts=('libplacebo')
source=('git+https://code.videolan.org/videolan/libplacebo.git')
sha256sums=('SKIP')

pkgver() {
  cd libplacebo
  echo "$(git describe --long --tags | tr -d v| tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd "${srcdir}/build"
  arch-meson ../libplacebo \
    -D vulkan=enabled \
    -D glslang=enabled \
    -D shaderc=enabled \
    -D lcms=enabled \
    -D d3d11=disabled \
    -D tests=true

  ninja

}

check() {
  ninja -C build test
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 libplacebo/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
