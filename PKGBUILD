# Maintainer: lod <aur@cyber-anlage.de>

pkgname=lib32-amdvlk
pkgver=2019.Q3.3
pkgrel=1

_llpc_commit=f60ebe48d60ef00e69b399a24e04d600cdcc1f0c
_xgl_commit=6b0fbc836e01be4b8fb1990b4e31846ec19305bc
_pal_commit=46251728a7137f399b564b0886bd9bf9888c48ef
_llvm_commit=951ae36dc33d628235446a7abe87a1aebf6717e8

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
        llvm-$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-Drivers/llvm/archive/${_llvm_commit}.tar.gz)
  
sha256sums=('d2aa97caeffef43c934b73d24af3c30be640d6ffee20e27db6a58bb21c683939'
            '4d6b623092215bfb8f9f01601db3de2b93cc0bf305173bafeb58c65f32967043'
            'fee95d0a55cbd9c34aa54c3309ad896d56c287f35bc7cd6bb25bd86f7e0985d6'
            '6832551a933fd04d8b1d031cf49b86497c17c878675fc641df23c9c9e128d52b'
            '50b25878e19cd8a7d15aad891463fbdac60cbb04b2a4027bc31ff9ca3da4a5f6')
            
prepare() {
  ln -sf ${srcdir}/AMDVLK-v-${pkgver} ${srcdir}/AMDVLK
  ln -sf ${srcdir}/xgl-${_xgl_commit} ${srcdir}/xgl
  ln -sf ${srcdir}/pal-${_pal_commit} ${srcdir}/pal
  ln -sf ${srcdir}/llpc-${_llpc_commit} ${srcdir}/llpc
  ln -sf ${srcdir}/llvm-${_llvm_commit} ${srcdir}/llvm
  
  #remove -Werror to build with gcc9 
  sed -i "s/-Werror//g" $srcdir/pal/shared/gpuopen/cmake/AMD.cmake
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
