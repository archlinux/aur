# Maintainer: lod <aur@cyber-anlage.de>

pkgname=lib32-amdvlk
pkgver=2019.Q3.1
pkgrel=1

_llpc_commit=aa8a9d7f2b7ad7b81b70e7959e99e3f31f85c211
_xgl_commit=eee58c8e482ac4a6fdc40452cb4ad744395d0f74
_pal_commit=6c8eaa257e6216437fdfe3f17d418eccfe42e0bd
_llvm_commit=8118692e8aefbd95f791ff49beddb8ce90e8927c

pkgdesc='Open-source Vulkan driver for AMD Radeon™ graphics adapters (32 Bit)'
arch=(x86_64)
url='https://github.com/GPUOpen-Drivers'
license=('MIT')
depends=('vulkan-icd-loader')
provides=('lib32-amdvlk' 'lib32-vulkan-driver')
conflicts=('lib32-vulkan-amdvlk' 'lib32-amdvlk' 'lib32-amdvlk-git')
makedepends=('cmake' 'dri2proto' 'gcc' 'lib32-gcc-libs' 'lib32-libdrm' 'lib32-libxml2' 'libxrandr' 'python' 'wayland' 'xorg-server-devel' 'ninja')

source=(https://github.com/GPUOpen-Drivers/AMDVLK/archive/v-${pkgver}.tar.gz
        https://github.com/GPUOpen-Drivers/llpc/archive/${_llpc_commit}.tar.gz
        https://github.com/GPUOpen-Drivers/xgl/archive/${_xgl_commit}.tar.gz
        https://github.com/GPUOpen-Drivers/pal/archive/${_pal_commit}.tar.gz
        https://github.com/GPUOpen-Drivers/llvm/archive/${_llvm_commit}.tar.gz)
  
sha256sums=('e41418633653279c55cc8d70a9f576e0de3018a3953bcb3372bfb809db48ae23'
            'f7efe91134588233e2d3f25ff53068fb0b7c6d144fabf907c7b8c807efe635e8'
            '828bf0936e0efc86c40e3abb6f92cc214a493ab8e2ff2054d455bab399ae2d0a'
            '83a4940d3bd64f38a83e14d7225cce6b2234610dbe6e3d55c50e1adc6126b2d2'
            'b0cbcd4d83530ad5bd515642f903837e6cc308eb68da51900208acf9f2dbe351')
            
prepare() {
  ln -sf ${srcdir}/AMDVLK-v-${pkgver} ${srcdir}/AMDVLK
  ln -sf ${srcdir}/xgl-${_xgl_commit} ${srcdir}/xgl
  ln -sf ${srcdir}/pal-${_pal_commit} ${srcdir}/pal
  ln -sf ${srcdir}/llpc-${_llpc_commit} ${srcdir}/llpc
  ln -sf ${srcdir}/llvm-${_llvm_commit} ${srcdir}/llvm
  
  #remove -Werror to build with gcc9 
  for i in xgl/icd/CMakeLists.txt llpc/CMakeLists.txt llpc/imported/metrohash/CMakeLists.txt llvm/utils/benchmark/CMakeLists.txt pal/src/core/imported/addrlib/CMakeLists.txt pal/src/core/imported/vam/CMakeLists.txt pal/shared/gpuopen/cmake/AMD.cmake
  do
    sed -i "s/-Werror//g" "$srcdir"/$i
  done
}

build() {
  cd xgl
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cmake -H. -Bbuilds/Release \
    -DCMAKE_C_FLAGS=-m32 \
    -DCMAKE_CXX_FLAGS=-m32 \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_TARGET_ARCH:STRING=i686 \
    -DLLVM_DEFAULT_TARGET_TRIPLE="i686-pc-linux-gnu" \
    -DBUILD_WAYLAND_SUPPORT=On \
    -G Ninja
    
  ninja -C builds/Release
}

package() {
  install -m755 -d ${pkgdir}/usr/lib32
  install -m755 -d ${pkgdir}/usr/share/vulkan/icd.d
  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  
  install xgl/builds/Release/icd/amdvlk32.so ${pkgdir}/usr/lib32/
  install AMDVLK/json/Redhat/amd_icd32.json ${pkgdir}/usr/share/vulkan/icd.d/
  install AMDVLK/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/

  sed -i "s/\/lib/\/lib32/g" ${pkgdir}/usr/share/vulkan/icd.d/amd_icd32.json
} 
