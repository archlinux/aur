# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=vkd3d-valve-git
pkgver=40e4a74
pkgrel=1
pkgdesc="D3D12 to Vulkan translation library (Valve version)"
arch=('x86_64')
url='https://github.com/ValveSoftware/vkd3d'
license=('LGPL')
depends=('spirv-tools'
         'vulkan-icd-loader'
         'libxcb'
         )
makedepends=( # Prevent out-of-date SPIRV headers error
             'spirv-headers-git'
             'vulkan-headers'
             'xcb-proto'
             'wine'
            )
conflicts=('vkd3d' 'vkd3d-git')
provides=('vkd3d')
source=('git+https://github.com/ValveSoftware/vkd3d.git#branch=proton_4.11')
sha256sums=('SKIP')

pkgver() {
  cd vkd3d
  git describe --always
}

prepare() {
  mkdir -p build

  cd vkd3d
  ./autogen.sh
}

build() {
  cd build
  ../vkd3d/configure \
    --prefix=/usr \
    --with-spirv-tools \
    --enable-tests=no

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
