# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=lib32-libplacebo-git
pkgver=v3.120.1.168.gbe32ca6
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives. (GIT version)'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=('lib32-vulkan-icd-loader'
         'lib32-lcms2'
         'lib32-shaderc'
         'lib32-glslang'
         'lib32-libepoxy'
         'lib32-glfw'
         'libavcodec.so'
         'libavutil.so'
         'libavformat.so'
         )
makedepends=('git'
             'meson'
             'ninja'
             'vulkan-headers'
             'python-mako'
             )
provides=('lib32-libplacebo'
          'libplacebo.so'
          )
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
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build
  arch-meson ../libplacebo \
    --libdir=/usr/lib32 \
    -D vulkan=enabled \
    -D glslang=enabled \
    -D shaderc=enabled \
    -D lcms=enabled \
    -D d3d11=disabled \
    -D tests=true

  ninja -v
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  rm -rf "${pkgdir}/usr/include"

  mv "${pkgdir}/usr/bin/plplay"  "${pkgdir}/usr/bin/plplay-32"

  install -Dm644 libplacebo/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
