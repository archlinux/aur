# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Contributor: Benjamin Maisonnas <ben@wainei.net>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Rebin Silva <rebinsilva@gmail.com>

pkgname=vkd3d-valve-git
pkgver=1.1.r1120.ge685793
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
             'git'
            )
conflicts=('vkd3d' 'vkd3d-git')
provides=('vkd3d')
source=('git+https://github.com/ValveSoftware/vkd3d.git#branch=proton_5.0')
sha256sums=('SKIP')

pkgver() {
  cd vkd3d
  git describe --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/vkd3d.//'
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
