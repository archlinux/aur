# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=amdvlk-git
pkgver=r23.baf3c1c
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver"
arch=(x86_64)
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
depends=('vulkan-icd-loader')
provides=('vulkan-amdvlk' 'vulkan-driver')
conflicts=('vulkan-amdvlk')
makedepends=('dri2proto' 'xorg-server-devel' 'cmake' 'python' 'libxml2' 'wayland' 'git')
source=('llvm::git+https://github.com/GPUOpen-Drivers/llvm.git#branch=amd-vulkan-dev'
	'git+https://github.com/GPUOpen-Drivers/xgl.git#branch=dev'
	'git+https://github.com/GPUOpen-Drivers/pal.git#branch=dev'
	'git+https://github.com/GPUOpen-Drivers/wsa.git#branch=master'
	'git+https://github.com/GPUOpen-Drivers/AMDVLK.git#branch=dev'
	'amdPalSettings.cfg'
	)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '5f798911bf1cbbe5a83f5ae4886107ef0d02be5753450753ae2d3fc6f80e7012')
            
pkgver() {
  XGL_VER=$(cd xgl; printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  #PAL_VER=$(cd pal; printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo "$XGL_VER"
}

prepare() {
  cd xgl
}

build() {
  msg "building xgl..."
  cd xgl
  cmake -H. -Bbuilds/Release64 \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_WAYLAND_SUPPORT=On \
    -DBUILD_WSA=On

  cd builds/Release64
  make
  msg "building xgl finished!"
}

package() {
  install -m755 -d "${pkgdir}"/usr/lib
  install -m755 -d "${pkgdir}"/usr/share/vulkan/icd.d
  install -m755 -d "${pkgdir}"/usr/share/licenses/amdvlk-git
  install -m755 -d "${pkgdir}"/etc/amd

  install xgl/builds/Release64/icd/amdvlk64.so "${pkgdir}"/usr/lib/
  install AMDVLK/json/Redhat/amd_icd64.json "${pkgdir}"/usr/share/vulkan/icd.d/
  install AMDVLK/LICENSE.txt "${pkgdir}"/usr/share/licenses/amdvlk-git/
  install amdPalSettings.cfg "${pkgdir}"/etc/amd/

  sed -i "s/\/lib64/\/lib/g" "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd64.json
}
