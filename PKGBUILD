# Maintainer: lod <aur@cyber-anlage.de>

pkgname=amdvlk
pkgver=2019.Q3.5
pkgrel=1

_llpc_commit=4fa48ef1cf0f81eafdb56df91c2f2180d4865101
_xgl_commit=331558e93794068a786bf699d3fe23bb11bac021
_pal_commit=68b57dba33a4d922e8f1ef1b3781c2f659ffbd1c
_llvm_commit=9bc5dd4450a6361faf5c5661056a7ee494fad830
_spvgen_commit=2f31d1170e8a12a66168b23235638c4bbc43ecdc
_spirvtools_commit=9702d47c6fe4cefbc55f905b0e9966452124b6c2
_spirvheaders_commit=123dc278f204f8e833e1a88d31c46d0edf81d4b2
_glslang_commit=22683b409e6df419da940df561b24b4b5d8ab90a
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
        llvm-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/llvm/archive/${_llvm_commit}.tar.gz
        spvgen-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/spvgen/archive/${_spvgen_commit}.tar.gz
        SPIRV-Tools-$pkgname-$pkgver.tar.gz::https://github.com/KhronosGroup/SPIRV-Tools/archive/${_spirvtools_commit}.tar.gz
        glslang-$pkgname-$pkgver.tar.gz::https://github.com/KhronosGroup/glslang/archive/${_glslang_commit}.tar.gz
        SPIRV-Headers-$pkgname-$pkgver.tar.gz::https://github.com/KhronosGroup/SPIRV-Headers/archive/${_spirvheaders_commit}.tar.gz
        MetroHash-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/MetroHash/archive/${_metrohash_commit}.tar.gz
        CWPack-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/CWPack/archive/${_cwpack_commit}.tar.gz)
  
sha256sums=('383d43ddcff3295bb8dc85bce2a376fbde9f2aa3535be9e4dbf67f745c40ff41'
            'abe541ef6cd4fa3ca1eaab52412caa29e2adedec0fab40894aef88d33deee584'
            '939a2cf69d840e01da8b3e69f5ffe1f852f9d2919cdbc8aa4ade7cff7ac56906'
            '7648ca7761b588b6025f8fe16fcf4216bf7e1fe53c6568377f5cca98feca9627'
            'efbde2752044ec74d522c160899491105dbc77bb8a08ff64c274d2b94a6916d1'
            'cc946ad2835e502aca904c5f87802a2004eaed4729cb5c1dc29a5258d1c1e401'
            '64820fab5f07b9525ae09afb7bd5c6cd2c898da41026f6517e83e67547bb659c'
            '627699304b84e638e3c40bc39bef8caddb68badd857a4415ced1b371760a20d8'
            'ca0a9c788e4b02c452f4df13657dff6fce93b23e71faa3366d2a828dcbe5a335'
            'e8ecf026584dd953e39c3abba2eb04d28b28ed4577482ee70265f0d421fef398'
            '58ca397f33d62bcfecaecd89eb4ad466a6c33e1c619e5cf742822074f1f7d664')
            
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
  ln -sf ${srcdir}/MetroHash-${_metrohash_commit} ${srcdir}/MetroHash
  ln -sf ${srcdir}/CWPack-${_metrohash_commit} ${srcdir}/CWPack

  #remove -Werror to build with gcc9 
  sed -i "s/-Werror//g" $srcdir/pal/shared/gpuopen/cmake/AMD.cmake
}

build() {
  # Package needs -fno-plt so we'll add it in case someone uses non-default build flags.. would it be better to add !buildflags option?
  # -mno-avx fixes crashes that occur with some configs
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
