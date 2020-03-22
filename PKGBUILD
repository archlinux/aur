# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=rpcs3-git
pkgver=0.0.9.r201.b447e6f55
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
  rpcs3-cereal::git+https://github.com/RPCS3/cereal.git
  rpcs3-curl::git+https://github.com/RipleyTom/curl.git
  rpcs3-hidapi::git+https://github.com/RPCS3/hidapi.git
  rpcs3-libusb::git+https://github.com/RPCS3/libusb.git
  rpcs3-llvm::git+https://github.com/RPCS3/llvm-mirror.git
  rpcs3-wolfssl::git+https://github.com/RipleyTom/wolfssl.git
  rpcs3-yaml-cpp::git+https://github.com/RPCS3/yaml-cpp.git
  git+https://github.com/kobalicek/asmjit.git
  git+https://github.com/FNA-XNA/FAudio.git
  git+https://github.com/KhronosGroup/glslang.git
  git+https://github.com/zeux/pugixml.git
  git+https://github.com/tcbrindle/span.git
  git+https://github.com/Cyan4973/xxHash.git
)
sha256sums=(
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
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

  git submodule init 3rdparty/{cereal,curl,FAudio,hidapi,libusb,pugixml,span,wolfssl,xxHash,yaml-cpp} asmjit llvm Vulkan/glslang
  git config submodule.asmjit.url ../asmjit
  git config submodule.cereal.url ../rpcs3-cereal
  git config submodule.cereal.url ../rpcs3-curl
  git config submodule.glslang.url ../glslang
  git config submodule.FAudio.url ../FAudio
  git config submodule.hidapi.url ../rpcs3-hidapi
  git config submodule.libusb.url ../rpcs3-libusb
  git config submodule.llvm.url ../rpcs3-llvm
  git config submodule.pugixml.url ../pugixml
  git config submodule.span.url ../span
  git config submodule.yaml-cpp ../rpcs3-wolfssl
  git config submodule.xxHash ../xxHash
  git config submodule.yaml-cpp ../rpcs3-yaml-cpp
  git submodule update 3rdparty/{cereal,curl,FAudio,hidapi,libusb,pugixml,span,wolfssl,xxHash,yaml-cpp} asmjit llvm Vulkan/glslang
}

build() {
  cmake -S rpcs3 -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_NATIVE_INSTRUCTIONS=OFF \
    -DUSE_SYSTEM_FFMPEG=ON \
    -DUSE_SYSTEM_LIBPNG=ON \
    -DUSE_SYSTEM_ZLIB=ON
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}

# vim: ts=2 sw=2 et:
