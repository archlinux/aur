# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-amdvlk-git
pkgver=r38.d88feee
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver (32-bit)"
arch=(x86_64)
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
depends=('lib32-vulkan-icd-loader')
provides=('lib32-vulkan-amdvlk' 'lib32-vulkan-driver')
conflicts=('lib32-vulkan-amdvlk')
makedepends=('dri2proto' 'xorg-server-devel' 'cmake' 'python' 'lib32-libxml2' 'lib32-libdrm' 'git')
source=('llvm::git+https://github.com/GPUOpen-Drivers/llvm.git#branch=amd-vulkan-dev'
	'git+https://github.com/GPUOpen-Drivers/xgl.git#branch=dev'
	'git+https://github.com/GPUOpen-Drivers/pal.git#branch=dev'
	'git+https://github.com/GPUOpen-Drivers/AMDVLK.git#branch=dev'
	'git+https://github.com/GPUOpen-Drivers/llpc.git#branch=dev'
	)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
            
pkgver() {
  XGL_VER=$(cd xgl; printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  #PAL_VER=$(cd pal; printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo "$XGL_VER"
}

prepare() {
  # fix building with commit f609020
  sed -i "s/<drm/<libdrm/g" pal/src/core/os/lnx/display/displayWindowSystem.h
}

build() {
  msg "building xgl..."
  cd xgl
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cmake -H. -Bbuilds/Release \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS=-m32 \
    -DCMAKE_CXX_FLAGS=-m32 \
    -DLLVM_TARGET_ARCH:STRING=i686 \
    -DLLVM_DEFAULT_TARGET_TRIPLE="i686-pc-linux-gnu"

  cd builds/Release
  make
  msg "building xgl finished!"
}

package() {
  depends=('amdvlk-git') # needed for /etc/amd/amdPalSettings.cfg
  
  install -m755 -d "${pkgdir}"/usr/lib32
  install -m755 -d "${pkgdir}"/usr/share/vulkan/icd.d
  install -m755 -d "${pkgdir}"/usr/share/licenses/lib32-amdvlk-git

  install xgl/builds/Release/icd/amdvlk32.so "${pkgdir}"/usr/lib32/
  install AMDVLK/json/Redhat/amd_icd32.json "${pkgdir}"/usr/share/vulkan/icd.d/
  install AMDVLK/LICENSE.txt "${pkgdir}"/usr/share/licenses/lib32-amdvlk-git/
  
  sed -i "s/\/lib/\/lib32/g" "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd32.json
}
