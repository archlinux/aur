# Maintainer: Orkut Murat Yılmaz (https://aur.archlinux.org/account/orkut)
pkgname=bitnet-git
pkgver=r96.01eb415
pkgrel=1
pkgdesc="Official inference framework for 1-bit LLMs"
arch=('x86_64' 'aarch64')
url="https://github.com/microsoft/BitNet"
license=('MIT')
depends=()
makedepends=('python' 'cmake' 'clang' 'git')
provides=('bitnet')
conflicts=('bitnet')
source=('git+https://github.com/microsoft/BitNet.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/BitNet"
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "$srcdir/BitNet"
    git submodule update --init --recursive

    # Setup default kernel headers based on architecture
    # This is required because bitnet.cpp expects these to be present during build
    if [[ $CARCH == "x86_64" ]]; then
        cp preset_kernels/bitnet_b1_58-3B/bitnet-lut-kernels-tl2.h include/bitnet-lut-kernels.h
    elif [[ $CARCH == "aarch64" ]]; then
        cp preset_kernels/bitnet_b1_58-3B/bitnet-lut-kernels-tl1.h include/bitnet-lut-kernels.h
    fi

    # Fix missing header for install process
    mkdir -p 3rdparty/llama.cpp/ggml/include/
    ln -sf ../../../../include/ggml-bitnet.h 3rdparty/llama.cpp/ggml/include/ggml-bitnet.h

    # Patch broken install rule for non-existent LlamaConfig.cmake and broken version generation
    sed -i '/LlamaConfig.cmake/d' CMakeLists.txt
    sed -i '/LlamaConfigVersion.cmake/d' CMakeLists.txt
    sed -i '/DESTINATION ${CMAKE_INSTALL_LIBDIR}\/cmake\/Llama/d' CMakeLists.txt
    sed -i '/write_basic_package_version_file/,/)/d' CMakeLists.txt

    # Fix incorrect path to llama.h
    sed -i 's|${CMAKE_CURRENT_SOURCE_DIR}/llama.h|${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/llama.cpp/include/llama.h|' CMakeLists.txt
}

build() {
    cd "$srcdir/BitNet"
    export CC=clang
    export CXX=clang++
    
    # Architecture specific flags
    local cmake_args=()
    if [[ $CARCH == "x86_64" ]]; then
        cmake_args+=("-DBITNET_X86_TL2=OFF")
    elif [[ $CARCH == "aarch64" ]]; then
        cmake_args+=("-DBITNET_ARM_TL1=OFF")
    fi

    cmake -B build "${cmake_args[@]}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

check() {
    cd "$srcdir/BitNet"
    # Placeholder for tests if available in upstream
}

package() {
    cd "$srcdir/BitNet"
    DESTDIR="$pkgdir" cmake --install build
}
