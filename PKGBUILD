# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=rpcs3-git
pkgver=0.0.4.r54.1344f15ef
pkgrel=1
pkgdesc='A Sony PlayStation 3 emulator'
arch=('x86_64')
url='https://github.com/RPCS3/rpcs3'
license=('GPL2')
depends=('alsa-lib' 'gcc-libs' 'glew' 'glibc' 'glu' 'libevdev' 'libgl' 'libpng'
         'libpulse' 'libx11' 'llvm40-libs' 'openal' 'qt5-base'
         'vulkan-icd-loader' 'yaml-cpp' 'zlib'
         'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libswresample.so'
         'libswscale.so' 'libudev.so')
makedepends=('boost' 'cereal' 'cmake' 'git' 'llvm40')
provides=('rpcs3')
conflicts=('rpcs3')
source=('git+https://github.com/RPCS3/rpcs3.git'
        'rpcs3-common::git+https://github.com/RPCS3/common.git'
        'rpcs3-hidapi::git+https://github.com/RPCS3/hidapi.git'
        'git+https://github.com/kobalicek/asmjit.git'
        'git+https://github.com/Microsoft/GSL.git'
        'git+https://github.com/KhronosGroup/glslang.git'
        'git+https://github.com/akrzemi1/Optional.git'
        'git+https://github.com/zeux/pugixml.git'
        'git+https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd rpcs3

  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  pushd rpcs3

  git submodule init 3rdparty/{GSL,hidapi,Optional,pugixml} asmjit Vulkan/{glslang,Vulkan-LoaderAndValidationLayers}
  git config submodule.asmjit.url ../asmjit
  git config submodule.glslang.url ../glslang
  git config submodule.GSL.url ../GSL
  git config submodule.hidapi.url ../rpcs3-hidapi
  git config submodule.Optional.url ../Optional
  git config submodule.pugixml.url ../pugixml
  git config submodule.Vulkan-LoaderAndValidationLayers ../Vulkan-LoaderAndValidationLayers
  git submodule update 3rdparty/{GSL,hidapi,Optional,pugixml} asmjit Vulkan/{glslang,Vulkan-LoaderAndValidationLayers}

  popd

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../rpcs3 \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_EXE_LINKER_FLAGS='-ldl -lyaml-cpp' \
    -DCMAKE_SKIP_RPATH='ON' \
    -DUSE_SYSTEM_FFMPEG='ON' \
    -DUSE_SYSTEM_LIBPNG='ON' \
    -DLLVM_DIR='/usr/lib/llvm-4.0/lib/cmake/llvm'
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
