# Maintainer: Jake Greenfield <xales at naveria dot com>
# Contributor: Frederik Schwan <freswa at archlinux dot org>

pkgname=wasi-compiler-rt21
pkgver=21.1.6
pkgrel=1
pkgdesc='WASI LLVM compiler runtime (LLVM 21)'
arch=('any')
url='https://compiler-rt.llvm.org/'
license=('Apache-2.0 WITH LLVM-exception')
depends=('wasi-libc')
makedepends=('cmake' 'ninja' 'llvm21' 'clang21' 'lld21')
source=(https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/compiler-rt-${pkgver}.src.tar.xz
        https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/cmake-$pkgver.src.tar.xz
        WASI.cmake
        wasi-sdk.cmake)
b2sums=('e2b4037f2b237b331ebb018a65e474eb06a6737cd703a3a76822842a00adf600cd11f1d8b5473038c2f237a8743a55b1e5c52575d3cbe8a4207068507cde17a7'
        '98034c262f6b63d0c0feec5a2915e569fe251456108d3f263348914f1cf8f293e16207cd47dfbab9da319310b256989afc7068421080b316331b8b5b6d2165c5'
        'c829d807c257921fddb8c4d3752ad2291a2beb116d414dd31e34b7f6b01599d8c4807db87ef9930456ed8c9f30e8648e77028fa0b903c3a5ea840514f6022cf4'
        '9f20eaa64069d20510a5ba6acdedfa4bbf723e1da13792bbbdfc57cc20d232962f5603a56c9723879624ab65e18f3770fda509dc76e3f099c3744acbfeabafc2')
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
    -DCMAKE_TOOLCHAIN_FILE="${srcdir}"/wasi-sdk.cmake \
    -DCOMPILER_RT_BAREMETAL_BUILD=On \
    -DCOMPILER_RT_INCLUDE_TESTS=OFF \
    -DCOMPILER_RT_HAS_FPIC_FLAG=OFF \
    -DCOMPILER_RT_DEFAULT_TARGET_ONLY=On \
    -DCOMPILER_RT_OS_DIR=wasi \
    -DWASI_SDK_PREFIX=/usr/lib/llvm21 \
    -DCMAKE_C_FLAGS="-fno-exceptions --sysroot=/usr/share/wasi-sysroot" \
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm21/lib/clang/${pkgver%%.*}/ \
    -DLLVM_DIR=/usr/lib/llvm21/lib/cmake/llvm \
    compiler-rt-${pkgver}.src/lib/builtins
  cmake --build build -v
}

package() {
  DESTDIR="${pkgdir}" cmake --install build -v

  ln -sr "${pkgdir}"/usr/lib/llvm21/lib/clang/${pkgver%%.*}/lib/{wasi,wasip1}
  ln -sr "${pkgdir}"/usr/lib/llvm21/lib/clang/${pkgver%%.*}/lib/{wasi,wasip2}

  install -Dm644 compiler-rt-${pkgver}.src/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
