# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3
pkgver=0.0.14
pkgrel=2
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=(x86_64)
url=https://rpcs3.net
license=(GPL2)
depends=(alsa-lib glew glu libavcodec.so libavutil.so libevdev libgl libice libncursesw.so libpng libpulse libsm libswscale.so libx11 libxext openal qt5-base qt5-declarative sdl2 vulkan-icd-loader zlib curl)
makedepends=(cmake git libglvnd python vulkan-validation-layers)
options=(!emptydirs)
source=(
    git+https://github.com/RPCS3/rpcs3.git#tag=v${pkgver}
    rpcs3-cereal::git+https://github.com/RPCS3/cereal.git
    rpcs3-hidapi::git+https://github.com/RPCS3/hidapi.git
    rpcs3-llvm::git+https://github.com/RPCS3/llvm-mirror.git
    rpcs3-yaml-cpp::git+https://github.com/RPCS3/yaml-cpp.git
    git+https://github.com/Cyan4973/xxHash.git
    git+https://github.com/FNA-XNA/FAudio.git
    git+https://github.com/google/flatbuffers.git
    git+https://github.com/KhronosGroup/glslang.git
    git+https://github.com/KhronosGroup/SPIRV-Headers.git
    git+https://github.com/KhronosGroup/SPIRV-Tools.git
    git+https://github.com/kobalicek/asmjit.git
    git+https://github.com/libusb/libusb.git
    git+https://github.com/wolfSSL/wolfssl.git
    git+https://github.com/tcbrindle/span.git
    git+https://github.com/zeux/pugixml.git
    9541.patch::https://patch-diff.githubusercontent.com/raw/RPCS3/rpcs3/pull/9541.patch
)

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '1f1ae64f976cafb0c25b689df6ffb72c')

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule."3rdparty/cereal".url ../rpcs3-cereal
    git config submodule."3rdparty/hidapi".url ../rpcs3-hidapi
    git config submodule."llvm".url ../rpcs3-llvm
    git config submodule."3rdparty/yaml-cpp".url ../rpcs3-yaml-cpp
    git config submodule."3rdparty/xxHash".url ../xxHash
    git config submodule."3rdparty/FAudio".url ../FAudio
    git config submodule."3rdparty/flatbuffers".url ../flatbuffers
    git config submodule."Vulkan/glslang".url ../glslang
    git config submodule."Vulkan/spirv-headers".url ../SPIRV-Headers
    git config submodule."Vulkan/spirv-tools".url ../SPIRV-Tools
    git config submodule."asmjit".url ../asmjit
    git config submodule."3rdparty/libusb".url ../libusb
    git config submodule."3rdparty/wolfssl".url ../wolfssl
    git config submodule."3rdparty/span".url ../span
    git config submodule."3rdparty/pugixml".url ../pugixml
    git submodule update

    # Fix compilation with post-release commit
    patch -Np1 -i "$srcdir/9541.patch"
}

build() {
    cmake -S "$pkgname" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_RPATH=ON \
        -DUSE_NATIVE_INSTRUCTIONS=OFF \
        -DUSE_SYSTEM_FFMPEG=ON \
        -DUSE_SYSTEM_LIBPNG=ON \
        -DUSE_SYSTEM_ZLIB=ON \
        -DUSE_SYSTEM_CURL=ON
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
