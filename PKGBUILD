# Maintainer: lod <aur@cyber-anlage.de>

pkgname=lib32-amdvlk
pkgver=2019.Q2.5
pkgrel=1

_llpc_commit=ddb909580e9996356c3bbe23bc1b14c44987eb4c
_xgl_commit=96d84068b622b2c3ce8cf9aa8ff597260aa5ad3f
_pal_commit=135258ac31901e1293fea5e2f599659ee438ba1f
_llvm_commit=b9910c8bfcccc63c07c959963fa567120d11f024

pkgdesc='AMDVLK - AMD Open Source Driver for Vulkan® (32 Bit)'
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
  
sha256sums=('4017d5ef9deacbbe0d1d952ce9f79242212f1ac94c39ed4daf267cb703618974'
            '32e6f6e330a7ff82bd7840e43a81d7950878c9eae93f0e1e376c37c27426c244'
            '49f6cfd63f89db1a2cbf1bb5be882919af45443e057efb1715785e0983b3cd32'
            'dfebaf29c6dedb9c6fcbe4d02407a4267703aa7ae570d105ef146f2df455486f'
            '8b0052682f0665e18ea3f4b7a9b533dce95949c366c0d82a9e388056706383ae')
            
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
    
  ninja -j 6 -l 6 -C builds/Release
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
