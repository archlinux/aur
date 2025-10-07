# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: lod <aur@cyber-anlage.de>

pkgname=lib32-amdvlk
pkgver=2025.Q2.1
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver"
arch=(x86_64)
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
provides=('lib32-vulkan-driver')
depends=('lib32-zstd')
makedepends=('perl-xml-xpath' 'python' 'lib32-wayland' 'lib32-libxrandr' 'xorg-server-devel' 'python-jinja'
             'directx-shader-compiler' 'python-ruamel-yaml' 'cmake' 'ninja' 'git')
options=('!lto')
source=("https://github.com/GPUOpen-Drivers/AMDVLK/archive/v-${pkgver}.tar.gz"
       0001-Avoid-inheritance-from-std-iterator.patch
       0001-Removed-non-compiling-assignment-operator.-Fixed-718.patch)
sha256sums=('183bcfde8e65ea186ada2490eb308aebe6f8c3ad5e202027d02cd2447f2d1831'
            'd54b75fa1bcd8f77206b1521843443fffad1b5769866a0cb924ed480a7b31b25'
            '5cbd148bf05ea4405552efecfe12f82f2d4d19c28319dbe71073172cad99a4c5')
            
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

  # Fix compilation of rapidjason
  cd ${srcdir}/pal/shared/devdriver/third_party/rapidjson/
  patch -Np1 -i ${srcdir}/0001-Avoid-inheritance-from-std-iterator.patch
  patch -Np1 -i ${srcdir}/0001-Removed-non-compiling-assignment-operator.-Fixed-718.patch
}

build() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${srcdir}/xgl
  cmake -H. -Bbuilds/Release \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS=-m32 \
    -DCMAKE_CXX_FLAGS=-m32 \
    -DLLVM_TARGET_ARCH:STRING=i686 \
    -DLLVM_DEFAULT_TARGET_TRIPLE="i686-pc-linux-gnu" \
    -DBUILD_WAYLAND_SUPPORT=On \
    -DVKI_RAY_TRACING=Off \
    -G Ninja
    
  ninja -C builds/Release
}

package() {
  depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-zlib' 'lib32-zstd')

  install -m755 -d "${pkgdir}"/usr/lib32
  install -m755 -d "${pkgdir}"/usr/share/vulkan/icd.d
  install -m755 -d "${pkgdir}"/usr/share/vulkan/implicit_layer.d
  install -m755 -d "${pkgdir}"/usr/share/licenses/${pkgname}

  install xgl/builds/Release/icd/amdvlk32.so "${pkgdir}"/usr/lib32/
  install xgl/builds/Release/icd/amd_icd32.json "${pkgdir}"/usr/share/vulkan/icd.d/
  install xgl/builds/Release/icd/amd_icd32.json "${pkgdir}"/usr/share/vulkan/implicit_layer.d/
  install AMDVLK-v-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
  
  sed -i "s/\/lib/\/lib32/g" "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd32.json
  sed -i "s/\/lib/\/lib32/g" "${pkgdir}"/usr/share/vulkan/implicit_layer.d/amd_icd32.json
}
