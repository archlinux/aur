# Maintainer: lod <aur@cyber-anlage.de>

pkgname=lib32-amdvlk
pkgver=2019.Q4.2
pkgrel=1

_llpc_commit=2ba438ad4c592229a4ae14bd4368e318ac4f81eb
_xgl_commit=ef2f9c22455a79eea10c14e44fe371c003322ba1
_pal_commit=76c5b997630e558158dbdd8ca24a120071068631
_llvmproject_commit=2c15e55bc4b7171d6fa4bbb0cd9265bb8ad999b8
_metrohash_commit=2b6fee002db6cc92345b02aeee963ebaaf4c0e2f
_cwpack_commit=b601c88aeca7a7b08becb3d32709de383c8ee428

pkgdesc='Open-source Vulkan driver for AMD Radeon™ graphics adapters (32 Bit)'
arch=(x86_64) 
url='https://github.com/GPUOpen-Drivers'
license=('MIT')
depends=('vulkan-icd-loader')
provides=('lib32-amdvlk' 'lib32-vulkan-driver')
conflicts=('lib32-vulkan-amdvlk' 'lib32-amdvlk' 'lib32-amdvlk-git')
makedepends=('cmake' 'dri2proto' 'gcc' 'lib32-gcc-libs' 'lib32-libdrm' 'lib32-libxml2' 'libxrandr' 'python' 'wayland' 'xorg-server-devel' 'ninja')

source=(AMDVLK-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/AMDVLK/archive/v-${pkgver}.tar.gz
        llpc-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/llpc/archive/${_llpc_commit}.tar.gz
        xgl-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/xgl/archive/${_xgl_commit}.tar.gz
        pal-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/pal/archive/${_pal_commit}.tar.gz
        llvm-project-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/llvm-project/archive/${_llvmproject_commit}.tar.gz
        MetroHash-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/MetroHash/archive/${_metrohash_commit}.tar.gz
        CWPack-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/CWPack/archive/${_cwpack_commit}.tar.gz)
  
sha256sums=('385c84e1a5cf6476d2a547418fdc41a10921c7a45be25dd0b7e7dfaee6cd63f8'
            '6a5af19c2797261f12e956a01ad2579122f439b8c2c724449c40e19d21f756fa'
            '2dc052d20f36f9544036a6ad1b467d62b7274e42e276041cf6ee54be88a83496'
            'fb828be64ab7ee30793df82ef7b537c8e94be88b46a631235416c1e9e296d867'
            '601f4f32147ef8d676b2ca7ef21a58ae3b0d0fd9c23018083790fad4bf202e59'
            'e8ecf026584dd953e39c3abba2eb04d28b28ed4577482ee70265f0d421fef398'
            '58ca397f33d62bcfecaecd89eb4ad466a6c33e1c619e5cf742822074f1f7d664')
            
prepare() {
  ln -sf ${srcdir}/AMDVLK-v-${pkgver} ${srcdir}/AMDVLK
  ln -sf ${srcdir}/xgl-${_xgl_commit} ${srcdir}/xgl
  ln -sf ${srcdir}/pal-${_pal_commit} ${srcdir}/pal
  ln -sf ${srcdir}/llpc-${_llpc_commit} ${srcdir}/llpc
  ln -sf ${srcdir}/llvm-project-${_llvmproject_commit} ${srcdir}/llvm-project
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
 
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd xgl
  
  cmake -H. -Bbuilds/Release \
    -DCMAKE_C_FLAGS=-m32 \
    -DCMAKE_CXX_FLAGS=-m32 \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_TARGET_ARCH:STRING=i686 \
    -DLLVM_DEFAULT_TARGET_TRIPLE="i686-pc-linux-gnu" \
    -DBUILD_WAYLAND_SUPPORT=On \
    -DXGL_METROHASH_PATH=${srcdir}/MetroHash \
    -DXGL_CWPACK_PATH=${srcdir}/CWPack \
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
