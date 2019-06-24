# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=amdvlk-git
pkgver=r76.96d8406
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver"
arch=(x86_64)
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
depends=('vulkan-icd-loader')
provides=('vulkan-amdvlk' 'vulkan-driver')
conflicts=('vulkan-amdvlk')
makedepends=('dri2proto' 'xorg-server-devel' 'libxrandr' 'cmake' 'python' 'libxml2' 'wayland' 'libdrm' 'git')
source=('llvm::git+https://github.com/GPUOpen-Drivers/llvm.git#branch=amd-vulkan-dev'
	'git+https://github.com/GPUOpen-Drivers/xgl.git#branch=dev'
	'git+https://github.com/GPUOpen-Drivers/pal.git#branch=dev'
	'git+https://github.com/GPUOpen-Drivers/wsa.git#branch=master'
	'git+https://github.com/GPUOpen-Drivers/AMDVLK.git#branch=dev'
	'git+https://github.com/GPUOpen-Drivers/llpc.git#branch=dev'
	)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
            
prepare() {
  # Don't turn Werror on for people will build with more recent compilers than you have. Just don't.
  for i in xgl/icd/CMakeLists.txt llpc/CMakeLists.txt llpc/imported/metrohash/CMakeLists.txt llvm/utils/benchmark/CMakeLists.txt llvm/utils/benchmark/test/CMakeLists.txt pal/src/core/imported/addrlib/CMakeLists.txt pal/src/core/imported/vam/CMakeLists.txt pal/shared/gpuopen/cmake/AMD.cmake
  do
    sed -i "s/-Werror//g" "$srcdir"/$i
  done

  # On my system this adds -isystem=/include, which breaks gcc's ability to find stdlib.h
  sed -i "s/if(LLVM_WITH_Z3)/if(FALSE)/g" "$srcdir"/llvm/lib/Support/CMakeLists.txt
}

pkgver() {
  XGL_VER=$(cd xgl; printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  #PAL_VER=$(cd pal; printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo "$XGL_VER"
}

build() {
  # /usr/lib/amdvlk64.so: undefined symbol: _ZN3Pal5Linux19DisplayWindowSystem30DeterminePresentationSupportedEPNS0_6DeviceEPvl
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  msg "building xgl..."
  cd xgl
  cmake -H. -Bbuilds/Release64 \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_WAYLAND_SUPPORT=On \
    -DBUILD_WSA=On \
    -DBUILD_XLIB_XRANDR_SUPPORT=On \
    || true

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

  sed -i "s/\/lib64/\/lib/g" "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd64.json
}
