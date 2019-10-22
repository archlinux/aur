# Maintainer: lod <aur@cyber-anlage.de>

pkgname=amdvlk
pkgver=2019.Q4.1
pkgrel=1

_llpc_commit=3f15347d38da804814fdd9e24e2875ee0b2b9245
_xgl_commit=19a031d9f73b95101fd4d3d594aca27c00feb180
_pal_commit=39abe2297ca58a2b84dcd9bc5e238fbc399bd6e0
_llvmproject_commit=40fbaf4c5446a361269c241d9112fff26575b5d0
_spvgen_commit=f1bc2ba988273c3724afffe72fe9cd933a022ce7
_spirvtools_commit=9702d47c6fe4cefbc55f905b0e9966452124b6c2
_spirvheaders_commit=af64a9e826bf5bb5fcd2434dd71be1e41e922563
_glslang_commit=3aac2d44b20d2fcedfbded41ca3cfa932b90ae6f
_metrohash_commit=2b6fee002db6cc92345b02aeee963ebaaf4c0e2f
_cwpack_commit=b601c88aeca7a7b08becb3d32709de383c8ee428

pkgdesc='Open-source Vulkan driver for AMD Radeon™ graphics adapters'
arch=('x86_64')
url='https://github.com/GPUOpen-Drivers'
license=('MIT')
depends=('vulkan-icd-loader')
provides=('vulkan-amdvlk' 'vulkan-driver')
conflicts=('amdvlk-git' 'amdvlk-deb' 'amdvlk-bin')
makedepends=('cmake' 'dri2proto' 'gcc' 'libdrm' 'libxml2' 'libxrandr' 'ninja' 'python' 'wayland' 'xorg-server-devel')

source=(AMDVLK-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/AMDVLK/archive/v-${pkgver}.tar.gz
        llpc-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/llpc/archive/${_llpc_commit}.tar.gz
        xgl-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/xgl/archive/${_xgl_commit}.tar.gz
        pal-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/pal/archive/${_pal_commit}.tar.gz
        llvm-project-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/llvm-project/archive/${_llvmproject_commit}.tar.gz
        spvgen-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/spvgen/archive/${_spvgen_commit}.tar.gz
        SPIRV-Tools-$pkgname-$pkgver.tar.gz::https://github.com/KhronosGroup/SPIRV-Tools/archive/${_spirvtools_commit}.tar.gz
        glslang-$pkgname-$pkgver.tar.gz::https://github.com/KhronosGroup/glslang/archive/${_glslang_commit}.tar.gz
        SPIRV-Headers-$pkgname-$pkgver.tar.gz::https://github.com/KhronosGroup/SPIRV-Headers/archive/${_spirvheaders_commit}.tar.gz
        MetroHash-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/MetroHash/archive/${_metrohash_commit}.tar.gz
        CWPack-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/CWPack/archive/${_cwpack_commit}.tar.gz)
  
sha256sums=('2265bd0be973d4511cd47da29052b368369e5ac4133f3b08ab8c89c51d759986'
            'd1957eb1aaaab89aab78f3d375cea93c4b91e47f602627b048f0fb71d8e7eb3d'
            '47fdcb4ed0c9b2e1f61abe761bab912ca228dfd6103c2070c94244c6a2f13b5e'
            '3def3a94e20dbb67cb4effdacc4c180ebf5bf30a4ae27ad6849cd32aa0628463'
            '6f469cac7c2deaff595cd689a83067da6cfbee0f97362f6fa9f6c50b5bb23b56'
            '77a4cad8691960b825e86b624bb5433f5098b8a49cb0d758e17c6d59e25a9361'
            '64820fab5f07b9525ae09afb7bd5c6cd2c898da41026f6517e83e67547bb659c'
            'f128ff27d185fbf7fadb5d498d9f2ca265d5e046025fa262d725dfaa2ab2c030'
            'e0522545b4fbf4c7ee50c1f31b883c275e5ba829141c9ebfa62fd96c08755966'
            'e8ecf026584dd953e39c3abba2eb04d28b28ed4577482ee70265f0d421fef398'
            '58ca397f33d62bcfecaecd89eb4ad466a6c33e1c619e5cf742822074f1f7d664')
            
prepare() {
  ln -sf ${srcdir}/AMDVLK-v-${pkgver} ${srcdir}/AMDVLK
  ln -sf ${srcdir}/xgl-${_xgl_commit} ${srcdir}/xgl
  ln -sf ${srcdir}/pal-${_pal_commit} ${srcdir}/pal
  ln -sf ${srcdir}/llpc-${_llpc_commit} ${srcdir}/llpc
  ln -sf ${srcdir}/llvm-project-${_llvmproject_commit} ${srcdir}/llvm-project
  ln -sf ${srcdir}/spvgen-${_spvgen_commit} ${srcdir}/spvgen
  ln -sf ${srcdir}/SPIRV-Tools-${_spirvtools_commit} ${srcdir}/spvgen/external/SPIRV-tools
  ln -sf ${srcdir}/SPIRV-Headers-${_spirvheaders_commit} ${srcdir}/spvgen/external/SPIRV-tools/external/SPIRV-Headers
  ln -sf ${srcdir}/glslang-${_glslang_commit} ${srcdir}/spvgen/external/glslang
  ln -sf ${srcdir}/MetroHash-${_metrohash_commit} ${srcdir}/MetroHash
  ln -sf ${srcdir}/CWPack-${_cwpack_commit} ${srcdir}/CWPack

  #remove -Werror to build with gcc9 
  sed -i "s/-Werror//g" $srcdir/pal/shared/gpuopen/cmake/AMD.cmake
}

build() {
  # Package needs -fno-plt so we'll add it in case someone uses non-default build flags.. would it be better to add !buildflags option?
  # -mno-avx fixes segfaults that occur with some configs https://github.com/GPUOpen-Drivers/AMDVLK/issues/50#issuecomment-472315431
  export CFLAGS="$CFLAGS -fno-plt -mno-avx"
  export CXXFLAGS="$CXXFLAGS -fno-plt -mno-avx"
  export LDFLAGS="$LDFLAGS -z now" 
  
  cd xgl

  cmake -H. -Bbuilds/Release64 \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_WAYLAND_SUPPORT=On \
    -DXGL_METROHASH_PATH=${srcdir}/MetroHash \
    -DXGL_CWPACK_PATH=${srcdir}/CWPack \
    -G Ninja
    
  msg "build amdvlk64.so"
  ninja -C builds/Release64
  
  msg "build spvgen.so"
  ninja -C builds/Release64 spvgen
}

package() {
  install -m755 -d ${pkgdir}/usr/lib
  install -m755 -d ${pkgdir}/usr/share/vulkan/icd.d
  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}

  install xgl/builds/Release64/icd/amdvlk64.so ${pkgdir}/usr/lib/
  install xgl/builds/Release64/spvgen/spvgen.so ${pkgdir}/usr/lib/
  install AMDVLK/json/Redhat/amd_icd64.json ${pkgdir}/usr/share/vulkan/icd.d/
  install AMDVLK/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/

  sed -i "s/\/lib64/\/lib/g" ${pkgdir}/usr/share/vulkan/icd.d/amd_icd64.json
} 
