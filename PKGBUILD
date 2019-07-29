# Maintainer: lod <aur@cyber-anlage.de>

pkgname=amdvlk
pkgver=2019.Q3.3
pkgrel=1


_llpc_commit=f60ebe48d60ef00e69b399a24e04d600cdcc1f0c
_xgl_commit=6b0fbc836e01be4b8fb1990b4e31846ec19305bc
_pal_commit=46251728a7137f399b564b0886bd9bf9888c48ef
_llvm_commit=951ae36dc33d628235446a7abe87a1aebf6717e8
_spvgen_commit=2f31d1170e8a12a66168b23235638c4bbc43ecdc
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

source=(AMDVLK-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/AMDVLK/archive/v-${pkgver}.tar.gz
        llpc-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/llpc/archive/${_llpc_commit}.tar.gz
        xgl-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/xgl/archive/${_xgl_commit}.tar.gz
        pal-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/pal/archive/${_pal_commit}.tar.gz
        llvm-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/llvm/archive/${_llvm_commit}.tar.gz
        spvgen-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/spvgen/archive/${_spvgen_commit}.tar.gz
        SPIRV-Tools-$pkgname-$pkgver.tar.gz::https://github.com/KhronosGroup/SPIRV-Tools/archive/${_spirvtools_commit}.tar.gz
        glslang-$pkgname-$pkgver.tar.gz::https://github.com/KhronosGroup/glslang/archive/${_glslang_commit}.tar.gz
        SPIRV-Headers-$pkgname-$pkgver.tar.gz::https://github.com/KhronosGroup/SPIRV-Headers/archive/${_spirvheaders_commit}.tar.gz)
  
sha256sums=('d2aa97caeffef43c934b73d24af3c30be640d6ffee20e27db6a58bb21c683939'
            '4d6b623092215bfb8f9f01601db3de2b93cc0bf305173bafeb58c65f32967043'
            'fee95d0a55cbd9c34aa54c3309ad896d56c287f35bc7cd6bb25bd86f7e0985d6'
            '6832551a933fd04d8b1d031cf49b86497c17c878675fc641df23c9c9e128d52b'
            '50b25878e19cd8a7d15aad891463fbdac60cbb04b2a4027bc31ff9ca3da4a5f6'
            'cc946ad2835e502aca904c5f87802a2004eaed4729cb5c1dc29a5258d1c1e401'
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

  install xgl/builds/Release64/icd/amdvlk64.so ${pkgdir}/usr/lib/
  install xgl/builds/Release64/spvgen/spvgen.so ${pkgdir}/usr/lib/
  install AMDVLK/json/Redhat/amd_icd64.json ${pkgdir}/usr/share/vulkan/icd.d/
  install AMDVLK/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/

  sed -i "s/\/lib64/\/lib/g" ${pkgdir}/usr/share/vulkan/icd.d/amd_icd64.json
} 
