# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Contributor: Benjamin Maisonnas <ben@wainei.net>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Rebin Silva <rebinsilva@gmail.com>

pkgname=lib32-vkd3d-valve-git
pkgver=1.1.r1120.ge685793
pkgrel=1
pkgdesc="D3D12 to Vulkan translation library. 32-bit (Valve version)"
arch=('x86_64')
url='https://github.com/ValveSoftware/vkd3d'
license=('LGPL')
depends=('vkd3d'
         'lib32-spirv-tools'
         'lib32-vulkan-icd-loader'
         'lib32-libxcb'
         )
makedepends=( # Prevent out-of-date SPIRV headers error
             'spirv-headers-git'
             'vulkan-headers'
             'xcb-proto'
             'wine'
             'git'
             )
conflicts=('lib32-vkd3d' 'lib32-vkd3d-git')
provides=('lib32-vkd3d')
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
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd build
  ../vkd3d/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-spirv-tools \
    --enable-tests=no \
    --host=i686-linux-gnu

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/include"
}
