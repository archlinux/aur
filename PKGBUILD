# Maintainer: lod <aur@cyber-anlage.de>

pkgname=lib32-amdvlk
pkgver=2019.Q3.4
pkgrel=1

_llpc_commit=0da6ca8e09f41639636a106f9b9ca74df50321ce
_xgl_commit=9b632ef4f132bddc94769702ed8b49efbc39d89c
_pal_commit=66e78b997748d03d77e1d706c10f1f17e18e5654
_llvm_commit=9bc5dd4450a6361faf5c5661056a7ee494fad830

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
  
sha256sums=('01777c1cfe4df7dce4feb91e75658fbc865dd5c755ff79451191a0cf8de1c7a4'
            '00bf10ff483ba5f6420fb3bfe34f7ce77c6d33515840df64ed1e2858e0eeb831'
            '6baede0581d63bdf88cc72c8c496b0cef534ee244dd4f74bcb39a9e0e0beeacd'
            'e8a29b20a166cb7139157a40e88b8087ed33097871dcaee1bfda61b6a417886f'
            'efbde2752044ec74d522c160899491105dbc77bb8a08ff64c274d2b94a6916d1')
            
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
    
  ninja -j 2 -l 2 -C builds/Release
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
