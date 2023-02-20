# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=libplacebo-git
pkgver=5.229.1.246.g2f48906f
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives. (GIT version)'
url='https://code.videolan.org/videolan/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=('libvulkan.so'
         'liblcms2.so'
         'glslang'
         'libepoxy.so'
#          'glfw'
         'libshaderc_shared.so'
         'libavcodec.so'
         'libavutil.so'
         'libavformat.so'
         'libdovi.so'
         )
makedepends=('git'
             'meson'
             'ninja'
             'vulkan-headers'
             'vulkan-icd-loader'
             'python-jinja'
             'python-markupsafe'
             'ffmpeg'
             'lcms2'
             'shaderc'
             'glad'
             'nuklear'
             'libdovi'
             )
_pkgver=$(echo $pkgver | cut -d . -f 1-3)
provides=("libplacebo=${_pkgver}"
          'libplacebo.so'
          )
conflicts=('libplacebo')
source=('git+https://code.videolan.org/videolan/libplacebo.git'
        )
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd libplacebo
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build
}

build() {
  cd "${srcdir}/build"
  arch-meson ../libplacebo \
    -D vulkan=enabled \
    -D lcms=enabled \
    -D d3d11=disabled \
    -D tests=true \
    -D demos=false

  ninja
}

check() {
  ninja -C build test || true
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 libplacebo/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
