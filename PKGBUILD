# Maintainer: luka null β <lukadevnull@vivaldi.net>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: lod <aur@cyber-anlage.de>

pkgname=amdvlk-2021q2.5
pkgver=2021.Q2.5
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver for pre-Raven (GCN 5.0 APU) and pre-Polaris (GCN 4.0) GPUs."
arch=(x86_64)
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
provides=('vulkan-driver')
makedepends=('perl-xml-xpath' 'python' 'wayland' 'libxrandr' 'xorg-server-devel' 'cmake' 'ninja' 'git')
makedepends+=('python2') # spvgen
conflicts=("amdvlk")
source=("https://github.com/GPUOpen-Drivers/AMDVLK/archive/v-${pkgver}.tar.gz")
sha256sums=('e115011f99356b41aa60381b4cde0519e25c6d2b369316a390367b224fe9eef7')
            
prepare() {
  local nrepos path name revision
  
  nrepos=$(xpath -q -e //project AMDVLK-v-${pkgver}/default.xml | wc -l)
  
  while (($nrepos>0))
  do
    path=$(xpath -q -e //project[$nrepos]/@path AMDVLK-v-${pkgver}/default.xml | sed 's/ path="drivers\/\(.*\)"/\1/g')
    name=$(xpath -q -e //project[$nrepos]/@name AMDVLK-v-${pkgver}/default.xml | sed 's/ name="\(.*\)"/\1/g')
    revision=$(xpath -q -e //project[$nrepos]/@revision AMDVLK-v-${pkgver}/default.xml | sed 's/ revision="\(.*\)"/\1/g')
    git clone https://github.com/GPUOpen-Drivers/$name $path
      pushd $path
        git checkout $revision
      popd
    (( nrepos-- ))
  done
}

build() {
  cd ${srcdir}/spvgen/external
  python2 fetch_external_sources.py

  cd ${srcdir}/xgl
  cmake -H. -Bbuilds/Release64 \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_WAYLAND_SUPPORT=On \
    -G Ninja
    
  ninja -C builds/Release64
  # only for compiling glsl with the standalone compiler (amdllpc)
  #ninja -C builds/Release64 spvgen
}

package() {
  install -m755 -d "${pkgdir}"/usr/lib
  install -m755 -d "${pkgdir}"/usr/share/vulkan/icd.d
  install -m755 -d "${pkgdir}"/usr/share/vulkan/implicit_layer.d
  install -m755 -d "${pkgdir}"/usr/share/licenses/${pkgname}

  install xgl/builds/Release64/icd/amdvlk64.so "${pkgdir}"/usr/lib/
  #install xgl/builds/Release64/spvgen/spvgen.so ${pkgdir}/usr/lib/
  install xgl/builds/Release64/icd/amd_icd64.json "${pkgdir}"/usr/share/vulkan/icd.d/
  install xgl/builds/Release64/icd/amd_icd64.json "${pkgdir}"/usr/share/vulkan/implicit_layer.d/
  install AMDVLK/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
  
  sed -i "s#/lib64#/lib#g" "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd64.json
  sed -i "s#/lib64#/lib#g" "${pkgdir}"/usr/share/vulkan/implicit_layer.d/amd_icd64.json
}
