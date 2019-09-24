# Maintainer: lod <aur@cyber-anlage.de>

pkgname=amdvlk
pkgver=2019.Q3.6
pkgrel=1

_llpc_commit=ec210a78b6a280b00fb1765dd588c3970b6dc818
_xgl_commit=2cb5558b94c5dc839e093cb439057a1802426c8e
_pal_commit=88d997710b4e405f3a8e3fd60a38afee9e3e77e2
_llvm_commit=1fc1a7d4248b4749c3df21eb48f7ae97b6cddf74
_spvgen_commit=2f31d1170e8a12a66168b23235638c4bbc43ecdc
_spirvtools_commit=9702d47c6fe4cefbc55f905b0e9966452124b6c2
_spirvheaders_commit=63d4d272f6e5b3cb9bb2bb50718a886a3eef4dab
_glslang_commit=3aac2d44b20d2fcedfbded41ca3cfa932b90ae6f
_metrohash_commit=690a521d9beb2e1050cc8f273fdabc13b31bf8f6
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
  
sha256sums=('1970d7cdf31e564c7a98737442fc7ed3593da24fb7e4dabe26ec120017aa0538'
            '88ae1c7d465e6313c324e2802ffa024fc3e1ed588ac4b48170c736fea9181e93'
            'fb9a6a497f488a3d9682b51ec9d615199b2f6770446b9cec47bd6a7c81278269'
            '063f3446339a42b08128b4acb5b74e846a0bb5ebd9d3aae3feec5011a1797f1d'
            '06104277583082701ca55c28093005919eead930fe93b8737e8e444628100535'
            'cc946ad2835e502aca904c5f87802a2004eaed4729cb5c1dc29a5258d1c1e401'
            '64820fab5f07b9525ae09afb7bd5c6cd2c898da41026f6517e83e67547bb659c'
            'f128ff27d185fbf7fadb5d498d9f2ca265d5e046025fa262d725dfaa2ab2c030'
            'b3df84c2ea1854ce6004c77348f22ccaa554af44bd1fc1a2e4b4954003aff17a'
            'a5c1e77efd593853ee93a8f168fb7826baae52ca56df1d46f9ccde3d4e1f6c12'
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
