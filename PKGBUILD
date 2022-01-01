# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3
pkgver=0.0.20
pkgrel=1
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=(x86_64)
url=https://rpcs3.net
license=(GPL2)
depends=(alsa-lib glew glu libavcodec.so libavutil.so libevdev libgl libice libncursesw.so libpng libpulse libsm libswscale.so libx11 libxext openal qt5-base qt5-declarative qt5-multimedia qt5-svg sdl2 vulkan-icd-loader zlib curl)
makedepends=(cmake git libglvnd python vulkan-validation-layers)
options=(!emptydirs)
source=(
    git+https://github.com/RPCS3/rpcs3.git#tag=v${pkgver}
    rpcs3-hidapi::git+https://github.com/RPCS3/hidapi.git
    rpcs3-llvm::git+https://github.com/RPCS3/llvm-mirror.git
    rpcs3-yaml-cpp::git+https://github.com/RPCS3/yaml-cpp.git
    git+https://github.com/Cyan4973/xxHash.git
    git+https://github.com/FNA-XNA/FAudio.git
    git+https://github.com/google/flatbuffers.git
    git+https://github.com/KhronosGroup/glslang.git
    git+https://github.com/KhronosGroup/SPIRV-Headers.git
    git+https://github.com/KhronosGroup/SPIRV-Tools.git
    git+https://github.com/asmjit/asmjit.git
    git+https://github.com/libusb/libusb.git
    git+https://github.com/wolfSSL/wolfssl.git
    git+https://github.com/zeux/pugixml.git
    git+https://github.com/mozilla/cubeb.git
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
         'SKIP')

prepare() {
    cd "$pkgname"
    git submodule init llvm 3rdparty/{asmjit/asmjit,hidapi/hidapi,yaml-cpp/yaml-cpp,xxHash,FAudio,flatbuffers,glslang/glslang,SPIRV/SPIRV-{Headers,Tools},libusb/libusb,wolfssl,pugixml,cubeb/cubeb}
    echo $_args | xargs -n 1 -- git submodule init
    git config submodule."3rdparty/hidapi".url "$srcdir"/rpcs3-hidapi
    git config submodule."llvm".url "$srcdir"/rpcs3-llvm
    git config submodule."3rdparty/yaml-cpp".url "$srcdir"/rpcs3-yaml-cpp
    git config submodule."3rdparty/xxHash".url "$srcdir"/xxHash
    git config submodule."3rdparty/FAudio".url "$srcdir"/FAudio
    git config submodule."3rdparty/flatbuffers".url "$srcdir"/flatbuffers
    git config submodule."3rdparty/glslang".url "$srcdir"/glslang
    git config submodule."3rdparty/SPIRV-Headers".url "$srcdir"/SPIRV-Headers
    git config submodule."3rdparty/SPIRV-Tools".url "$srcdir"/SPIRV-Tools
    git config submodule."asmjit".url "$srcdir"/asmjit
    git config submodule."3rdparty/libusb".url "$srcdir"/libusb
    git config submodule."3rdparty/wolfssl".url "$srcdir"/wolfssl
    git config submodule."3rdparty/pugixml".url "$srcdir"/pugixml
    git config submodule."3rdparty/cubeb/cubeb".url "$srcdir"/cubeb
    git submodule update llvm 3rdparty/{asmjit/asmjit,hidapi/hidapi,yaml-cpp/yaml-cpp,xxHash,FAudio,flatbuffers,glslang/glslang,SPIRV/SPIRV-{Headers,Tools},libusb/libusb,wolfssl,pugixml,cubeb/cubeb}
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
