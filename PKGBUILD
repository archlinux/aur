# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>
# Contributor: Frederik Schwan <freswa at archlinux dot org>

pkgname=wasi-compiler-rt17
pkgver=17.0.6
pkgrel=2
pkgdesc='WASI LLVM compiler runtime (LLVM 17)'
arch=('any')
url='https://compiler-rt.llvm.org/'
license=('custom:Apache 2.0 with LLVM Exception')
depends=('wasi-libc')
makedepends=('cmake' 'ninja' 'llvm17' 'clang17' 'lld17')
source=(https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/compiler-rt-${pkgver}.src.tar.xz
        https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/cmake-$pkgver.src.tar.xz
        WASI.cmake
        wasi-toolchain.cmake)
b2sums=('f59c7df8721429d518ed7475148f5d852b871d22db948f8e453d49e4450a7644932dc8ac1d82462777689983711311a3e9517dcc8e953214ddcaa3f54ab0c278'
        'f95c1c951ba7bd943931bb18c8dc23ef0b3c20ee3dd254d458ab7a3339097fc0f9e11c3b892c352e3f5f131014265a6bb116f56c9ebd78408f05158a90f51d6b'
        'c829d807c257921fddb8c4d3752ad2291a2beb116d414dd31e34b7f6b01599d8c4807db87ef9930456ed8c9f30e8648e77028fa0b903c3a5ea840514f6022cf4'
        '5f23ed508b2ea4d8a4ad27ea01d971b2529f787e47d56dfc8fa9ee7b51fa8594ad3ffb5ff9a2872e86d86d39a8f5ee1af7ea2f505f8b917a73a4bf3aa0ceaf47')
options=('staticlibs')

prepare() {
  # Platform files have been copied from here https://github.com/WebAssembly/wasi-sdk
  mv cmake{-$pkgver.src,}
  mkdir -p cmake/Platform
  cp WASI.cmake cmake/Platform
}

build() {
  # Build options are derived from here https://github.com/WebAssembly/wasi-sdk/blob/main/Makefile

  # Currently, wasi-sdk requires C++ code be compiled with -fno-exceptions. libc++abi is compiled, however is is currently compiled with exception-handling support disabled.
  # https://github.com/WebAssembly/wasi-sdk/issues/52#issuecomment-530619365
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER_WORKS=ON \
    -DCMAKE_CXX_COMPILER_WORKS=ON \
    -DCMAKE_MODULE_PATH="${srcdir}"/make \
    -DCMAKE_TOOLCHAIN_FILE="${srcdir}"/wasi-toolchain.cmake \
    -DCOMPILER_RT_BAREMETAL_BUILD=On \
    -DCOMPILER_RT_INCLUDE_TESTS=OFF \
    -DCOMPILER_RT_HAS_FPIC_FLAG=OFF \
    -DCOMPILER_RT_DEFAULT_TARGET_ONLY=On \
    -DCOMPILER_RT_OS_DIR=wasi \
    -DWASI_SDK_PREFIX=/usr/lib/llvm17 \
    -DCMAKE_C_FLAGS="-fno-exceptions --sysroot=/usr/share/wasi-sysroot" \
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm17/lib/clang/${pkgver%%.*}/ \
    -DLLVM_DIR=/usr/lib/llvm17/lib/cmake/llvm \
    compiler-rt-${pkgver}.src/lib/builtins
  cmake --build build -v
}

package() {
  DESTDIR="${pkgdir}" cmake --install build -v

  install -Dm644 compiler-rt-${pkgver}.src/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
