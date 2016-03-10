# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=rpcs3-git
pkgver=0.0.0.6.r551.4c133ab
pkgrel=1
pkgdesc='A Sony PlayStation 3 emulator'
arch=('x86_64')
url='https://github.com/DHrpcs3/rpcs3'
license=('GPL2')
depends=('gcc-libs' 'glew' 'glibc' 'libgl' 'libx11' 'openal' 'wxgtk'
         'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libswscale.so')
makedepends=('cmake' 'git')
provides=('rpcs3')
conflicts=('rpcs3')
source=('git+https://github.com/RPCS3/rpcs3.git'
        'git+https://github.com/RPCS3/common'
        'git+https://github.com/RPCS3/rsx_program_decompiler.git'
        'git+https://github.com/kobalicek/asmjit.git#commit=b0dad1a'
        'git+https://github.com/Microsoft/GSL.git'
        'git+https://github.com/KhronosGroup/glslang.git'
        'git+https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git'
        'rpcs3-system-libs.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '892f75551e2335e1614451da43b48a927469f3b5242467f1dd3cdcc64b0bbbc6')

pkgver() {
  cd rpcs3

  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd rsx_program_decompiler

  git submodule init common
  git config submodule.common.url ../common
  git submodule update common

  cd ../rpcs3

  git submodule init asmjit GSL rsx_program_decompiler Vulkan/{glslang,Vulkan-LoaderAndValidationLayers}
  git config submodule.asmjit.url ../asmjit
  git config submodule.GSL.url ../GSL
  git config submodule.rsx_program_decompiler.url ../rsx_program_decompiler
  git config submodule.glslang.url ../glslang
  git config submodule.Vulkan-LoaderAndValidationLayers ../Vulkan-LoaderAndValidationLayers
  git submodule update asmjit GSL rsx_program_decompiler Vulkan/{glslang,Vulkan-LoaderAndValidationLayers}

  patch -Np1 -i ../rpcs3-system-libs.patch

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd rpcs3/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_SKIP_RPATH='TRUE'
  make
}

package() {
  cd rpcs3/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 bin/rpcs3 "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
