# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=('libplacebo-git'
         'lib32-libplacebo-git'
         )
pkgver=v4.157.0.4.ge3331da
pkgrel=1
url='https://code.videolan.org/videolan/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
makedepends=('git'
             'meson'
             'ninja'
             'vulkan-headers'
             'python-mako'
             'ffmpeg'
             'lib32-ffmpeg'
             'shaderc'
             'lib32-shaderc'
             'glslang'
             'lib32-glslang'
             'lcms2'
             'lib32-lcms2'
             'vulkan-icd-loader'
             'lib32-vulkan-icd-loader'
             'libepoxy'
             'lib32-libepoxy'
             'glfw'
             'lib32-glfw'
             )
conflicts=('libplacebo')
source=('git+https://code.videolan.org/videolan/libplacebo.git')
sha256sums=('SKIP')

pkgver() {
  cd libplacebo
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build{32,64}
}

build() {
  cd "${srcdir}/build64"
  arch-meson ../libplacebo \
    -D vulkan=enabled \
    -D glslang=enabled \
    -D shaderc=enabled \
    -D lcms=enabled \
    -D d3d11=disabled \
    -D tests=true

  ninja

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/build32"
  arch-meson ../libplacebo \
    --libdir=/usr/lib32 \
    -D vulkan=enabled \
    -D glslang=enabled \
    -D shaderc=enabled \
    -D lcms=enabled \
    -D d3d11=disabled \
    -D tests=true

  ninja
}

check() {
  ninja -C build64 test
  ninja -C build32 test
}

package_libplacebo-git() {
  pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives. (GIT version)'
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
            "libplacebo=${pkgver}"
            'libplacebo.so'
          )

  DESTDIR="${pkgdir}" ninja -C build64 install

  install -Dm644 libplacebo/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_lib32-libplacebo-git() {
  pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives. (GIT version) (32-bits)'
  depends=("libplacebo=${pkgver}"
           'libvulkan.so'
           'liblcms2.so'
           'lib32-glslang'
           'lib32-libepoxy'
           'lib32-glfw'
           'libshaderc_shared.so'
           'libavcodec.so'
           'libavutil.so'
           'libavformat.so'
           )
  provides=('lib32-libplacebo'
            'libplacebo.so'
          )
  conflicts=('lib32-libplacebo')

  DESTDIR="${pkgdir}" ninja -C build32 install

  mv "${pkgdir}/usr/bin/plplay" "${pkgdir}/usr/bin/plplay-32"
  rm -fr "${pkgdir}/usr/include"

  install -Dm644 libplacebo/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
