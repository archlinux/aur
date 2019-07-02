# Maintainer: lod <aur@cyber-anlage.de>

pkgname=amdvlk
pkgver=2019.Q3.1
pkgrel=1

_llpc_commit=aa8a9d7f2b7ad7b81b70e7959e99e3f31f85c211
_xgl_commit=eee58c8e482ac4a6fdc40452cb4ad744395d0f74
_pal_commit=6c8eaa257e6216437fdfe3f17d418eccfe42e0bd
_llvm_commit=8118692e8aefbd95f791ff49beddb8ce90e8927c
_spvgen_commit=53245b96b7a647743f50b9d841751f9755002661
_spirvtools_commit=ce19e217bc82e1dbd631b6a555b1874432f3a05f
_spirvheaders_commit=c4f8f65792d4bf2657ca751904c511bbcf2ac77b
_glslang_commit=c11e3156af2297f89a23c8db3f5e2323733ee556

pkgdesc='Open-source Vulkan driver for AMD Radeon™ graphics adapters'
arch=('x86_64')
url='https://github.com/GPUOpen-Drivers'
license=('MIT')
depends=('vulkan-icd-loader')
provides=('vulkan-amdvlk' 'vulkan-driver')
conflicts=('amdvlk-git' 'amdvlk-deb' 'amdvlk-bin')
makedepends=('cmake' 'dri2proto' 'gcc' 'libdrm' 'libxml2' 'libxrandr' 'ninja' 'python' 'wayland' 'xorg-server-devel')

source=(amdPalSettings.cfg
        https://github.com/GPUOpen-Drivers/AMDVLK/archive/v-${pkgver}.tar.gz
        https://github.com/GPUOpen-Drivers/llpc/archive/${_llpc_commit}.tar.gz
        https://github.com/GPUOpen-Drivers/xgl/archive/${_xgl_commit}.tar.gz
        https://github.com/GPUOpen-Drivers/pal/archive/${_pal_commit}.tar.gz
        https://github.com/GPUOpen-Drivers/llvm/archive/${_llvm_commit}.tar.gz
        https://github.com/GPUOpen-Drivers/spvgen/archive/${_spvgen_commit}.tar.gz
        https://github.com/KhronosGroup/SPIRV-Tools/archive/${_spirvtools_commit}.tar.gz
        https://github.com/KhronosGroup/glslang/archive/${_glslang_commit}.tar.gz
        https://github.com/KhronosGroup/SPIRV-Headers/archive/${_spirvheaders_commit}.tar.gz)
  
sha256sums=('81dd70606621713217de5a4cc2aabf6b9e34d4324b5eaaf0429e4f88c9b60b42'
            'e41418633653279c55cc8d70a9f576e0de3018a3953bcb3372bfb809db48ae23'
            'f7efe91134588233e2d3f25ff53068fb0b7c6d144fabf907c7b8c807efe635e8'
            '828bf0936e0efc86c40e3abb6f92cc214a493ab8e2ff2054d455bab399ae2d0a'
            '83a4940d3bd64f38a83e14d7225cce6b2234610dbe6e3d55c50e1adc6126b2d2'
            'b0cbcd4d83530ad5bd515642f903837e6cc308eb68da51900208acf9f2dbe351'
            '253bfaf1fc33c8ef01ca1681a5ea7400fd4ab7373c48e4f79beb10d89455d307'
            '7d100132a55af3a024478d0793a8809f1aa9690d12e0d26e72455f021e06b97e'
            '60ee8f0301eef76cfa913da718e31e3650a903e8ea88852ef88189eff0427a6b'
            'aa89dbeeef92da345082020a7503dea2cadb6f443deb4eca3fcbe28043370154')
            
prepare() {
  ln -sf ${srcdir}/AMDVLK-v-${pkgver} ${srcdir}/AMDVLK
  ln -sf ${srcdir}/xgl-${_xgl_commit} ${srcdir}/xgl
  ln -sf ${srcdir}/pal-${_pal_commit} ${srcdir}/pal
  ln -sf ${srcdir}/llpc-${_llpc_commit} ${srcdir}/llpc
  ln -sf ${srcdir}/llvm-${_llvm_commit} ${srcdir}/llvm
  ln -sf ${srcdir}/spvgen-${_spvgen_commit} ${srcdir}/spvgen
  ln -sf ${srcdir}/SPIRV-Tools-${_spirvtools_commit} ${srcdir}/spvgen/external/SPIRV-tools
  ln -sf ${srcdir}/SPIRV-Headers-${_spirvheaders_commit} ${srcdir}/spvgen/external/SPIRV-tools/external/SPIRV-Headers
  ln -sf ${srcdir}/glslang-${_glslang_commit} ${srcdir}/spvgen/external/glslang

  #remove -Werror to build with gcc9 
  sed -i "s/-Werror//g" $srcdir/pal/shared/gpuopen/cmake/AMD.cmake
}

build() {
  cd xgl

  cmake -H. -Bbuilds/Release64 \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_WAYLAND_SUPPORT=On \
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
  install -m755 -d ${pkgdir}/etc/amd

  install xgl/builds/Release64/icd/amdvlk64.so ${pkgdir}/usr/lib/
  install xgl/builds/Release64/spvgen/spvgen.so ${pkgdir}/usr/lib/
  install AMDVLK/json/Redhat/amd_icd64.json ${pkgdir}/usr/share/vulkan/icd.d/
  install AMDVLK/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/
  install amdPalSettings.cfg ${pkgdir}/etc/amd/

  sed -i "s/\/lib64/\/lib/g" ${pkgdir}/usr/share/vulkan/icd.d/amd_icd64.json
} 
