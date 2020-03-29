# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
# Submitter: Maxime Gauduin <alucryd@archlinux.org>

pkgname=rpcs3-git
pkgver=0.0.9.r278.6d32ebecc
pkgrel=1
pkgdesc='A Sony PlayStation 3 emulator'
arch=(x86_64)
url=https://github.com/RPCS3/rpcs3
license=(GPL2)
depends=(
  alsa-lib
  glew
  glu
  libavcodec.so
  libavutil.so
  libevdev
  libgl
  libice
  libncursesw.so
  libpng
  libpulse
  libsm
  libswscale.so
  libx11
  libxext
  openal
  qt5-base
  qt5-declarative
  sdl2
  vulkan-icd-loader
  zlib
  curl
)
makedepends=(
  cmake
  git
  libglvnd
  python
  vulkan-validation-layers
)
provides=(rpcs3)
conflicts=(rpcs3)
options=(!emptydirs)
source=(
  git+https://github.com/RPCS3/rpcs3.git
  rpcs3-llvm::git+https://github.com/RPCS3/llvm-mirror.git
  git+https://github.com/KhronosGroup/glslang.git
)
sha256sums=(
  SKIP
  SKIP
  SKIP
)

pkgver() {
  cd rpcs3

  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd rpcs3
  
  git submodule init Vulkan/glslang llvm
  git config submodule.glslang.url ../glslang
  git config submodule.llvm.url ../rpcs3-llvm
  
  SUBMODULES=$(git config --file .gitmodules --get-regexp path | awk '!/ffmpeg/ && !/libpng/ && !/zlib/ && !/curl/ && !/wolfssl/ && !/llvm/ && !/glslang/ { print $2 }')
  
  git submodule update --init --depth=1 $SUBMODULES
  
  git submodule update Vulkan/glslang llvm
}

build() {
  cmake -S rpcs3 -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_NATIVE_INSTRUCTIONS=OFF \
    -DUSE_SYSTEM_FFMPEG=ON \
    -DUSE_SYSTEM_LIBPNG=ON \
    -DUSE_SYSTEM_ZLIB=ON \
    -DUSE_SYSTEM_CURL=ON
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}

# vim: ts=2 sw=2 et:
