# Maintainer: lod <aur@cyber-anlage.de>

pkgname=amdvlk
pkgver=2019.Q2.5
pkgrel=7

_llpc_commit=ddb909580e9996356c3bbe23bc1b14c44987eb4c
_xgl_commit=96d84068b622b2c3ce8cf9aa8ff597260aa5ad3f
_pal_commit=135258ac31901e1293fea5e2f599659ee438ba1f
_llvm_commit=b9910c8bfcccc63c07c959963fa567120d11f024
_spvgen_commit=64013f150c2d41965a3d36fa159b55fba52b727a
_spirvtools_commit=ce19e217bc82e1dbd631b6a555b1874432f3a05f
_spirvheaders_commit=c4f8f65792d4bf2657ca751904c511bbcf2ac77b
_glslang_commit=4e6b9ea32900b7bae6728eb8167657cdae7b16dc

pkgdesc='AMDVLK - AMD Open Source Driver for Vulkan®'
arch=('x86_64')
url='https://github.com/GPUOpen-Drivers'
license=('MIT')
depends=('vulkan-icd-loader')
provides=('vulkan-amdvlk' 'vulkan-driver')
conflicts=('amdvlk-git' 'amdvlk-deb' 'amdvlk-bin')
makedepends=('cmake' 'dri2proto' 'gcc8' 'libdrm' 'libxml2' 'libxrandr' 'ninja' 'python' 'wayland' 'xorg-server-devel')

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
            '4017d5ef9deacbbe0d1d952ce9f79242212f1ac94c39ed4daf267cb703618974'
            '32e6f6e330a7ff82bd7840e43a81d7950878c9eae93f0e1e376c37c27426c244'
            '49f6cfd63f89db1a2cbf1bb5be882919af45443e057efb1715785e0983b3cd32'
            'dfebaf29c6dedb9c6fcbe4d02407a4267703aa7ae570d105ef146f2df455486f'
            '8b0052682f0665e18ea3f4b7a9b533dce95949c366c0d82a9e388056706383ae'
            '01b156285b25c4f84fc098f334b3959d8fd1d7f77589618449288506eadb92d4'
            '7d100132a55af3a024478d0793a8809f1aa9690d12e0d26e72455f021e06b97e'
            '2d78ae9ad4d39a58dc91cf7b39276d59f90fbe171b4935fd1b69ddd2906d7ee4'
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
}

build() {
  cd xgl
  
  #export gcc8 executables because it doesn't build with gcc9 yet
  export CC=/usr/bin/gcc-8
  export CXX=/usr/bin/g++-8

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
