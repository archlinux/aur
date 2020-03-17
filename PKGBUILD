# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lib32-vkd3d-git
pkgver=1.1.689.ga59f198
pkgrel=1
pkgdesc='D3D12 to Vulkan translation library. 32-bits (GIT version)'
arch=('x86_64')
url='https://source.winehq.org/git/vkd3d.git'
license=('LGPL')
depends=('vkd3d'
         'lib32-spirv-tools'
         'lib32-vulkan-icd-loader'
         'lib32-libxcb'
         )
makedepends=('spirv-headers'
             'vulkan-headers'
             'xcb-proto'
             'wine'
             )
conflicts=('lib32-vkd3d')
provides=('lib32-vkd3d')
source=('git+https://source.winehq.org/git/vkd3d.git')
sha256sums=('SKIP')

pkgver() {
  cd vkd3d
  echo "$(git describe --long --tags | tr - . | sed 's|vkd3d.||')"
}

prepare() {
  mkdir -p build

  cd vkd3d
  ./autogen.sh
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd build
  ../vkd3d/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-spirv-tools \
    --enable-tests=no

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/include"
}
