# Maintainer: libreliu <libreliu@foxmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: lod <aur@cyber-anlage.de>

pkgname=amdvlk-debug
pkgver=2023.Q2.3
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver, debug build"
arch=(x86_64)
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
provides=('vulkan-amdvlk' 'amdvlk' 'vulkan-driver')
conflicts=('vulkan-amdvlk' 'amdvlk')
makedepends=('perl-xml-xpath' 'python' 'wayland' 'libxrandr' 'xorg-server-devel' 'directx-shader-compiler' 'glslang'
             'cmake' 'ninja' 'git')
options=('!lto' '!strip')
source=("https://github.com/GPUOpen-Drivers/AMDVLK/archive/v-${pkgver}.tar.gz"
        cstdint.patch)
sha256sums=('0fd70d472200c98dabdf86b58a0cf7a1af1a46dd32d02d165676faa8dedf16f7'
            '4509fd9a02aa15a94317228df31402879631f567719d0588225adc2eafe61318')
            
prepare() {
  local nrepos path name revision
  
  nrepos=$(xpath -q -e //project AMDVLK-v-${pkgver}/default.xml | wc -l)
  
  while (($nrepos>0))
  do
    path=$(xpath -q -e //project[$nrepos]/@path AMDVLK-v-${pkgver}/default.xml | sed 's/ path="drivers\/\(.*\)"/\1/g')
    name=$(xpath -q -e //project[$nrepos]/@name AMDVLK-v-${pkgver}/default.xml | sed 's/ name="\(.*\)"/\1/g')
    revision=$(xpath -q -e //project[$nrepos]/@revision AMDVLK-v-${pkgver}/default.xml | sed 's/ revision="\(.*\)"/\1/g')
    git clone --recurse-submodules https://github.com/GPUOpen-Drivers/$name $path
      pushd $path
        git checkout $revision
        git submodule update
      popd
    (( nrepos-- ))
  done

  patch -Np1 -i cstdint.patch
}

build() {
  cd ${srcdir}/xgl
  cmake -H. -Bbuilds/Debug64 \
    -DCMAKE_BUILD_TYPE=Debug \
    -DBUILD_WAYLAND_SUPPORT=On \
    -G Ninja
    
  ninja -C builds/Debug64
}

package() {
  install -m755 -d "${pkgdir}"/usr/lib
  install -m755 -d "${pkgdir}"/usr/share/vulkan/icd.d
  install -m755 -d "${pkgdir}"/usr/share/vulkan/implicit_layer.d
  install -m755 -d "${pkgdir}"/usr/share/licenses/${pkgname}

  install xgl/builds/Debug64/icd/amdvlk64.so "${pkgdir}"/usr/lib/
  install xgl/builds/Debug64/icd/amd_icd64.json "${pkgdir}"/usr/share/vulkan/icd.d/
  install xgl/builds/Debug64/icd/amd_icd64.json "${pkgdir}"/usr/share/vulkan/implicit_layer.d/
  install AMDVLK-v-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
  
  sed -i "s#/lib64#/lib#g" "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd64.json
  sed -i "s#/lib64#/lib#g" "${pkgdir}"/usr/share/vulkan/implicit_layer.d/amd_icd64.json
}
