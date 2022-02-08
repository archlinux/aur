# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=wasi-compiler-rt
pkgver=13.0.1
pkgrel=1
pkgdesc='WASI LLVM compiler runtime'
arch=('any')
url='https://compiler-rt.llvm.org/'
license=('custom:Apache 2.0 with LLVM Exception')
depends=('wasi-libc')
makedepends=('cmake' 'ninja' 'llvm' 'clang' 'lld')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/compiler-rt-${pkgver}.src.tar.xz"{,.sig}
        WASI.cmake
        wasi-toolchain.cmake)
b2sums=('65f99d2b982e47bec47fc110987774a30bf185069d96d0a3d85adb55df9283ddce5c1cff48b77d93affa18d55f05ca90d710e0302cc8655f889fffa5928f237f'
        'SKIP'
        'c829d807c257921fddb8c4d3752ad2291a2beb116d414dd31e34b7f6b01599d8c4807db87ef9930456ed8c9f30e8648e77028fa0b903c3a5ea840514f6022cf4'
        '74c63bb838bc2e6d7980370fb3d47f8fd2f1dd8b6dc82302c7cc0b80e0fb1e8e21c1c62d6de0b78e478fc22611a5867e52b1ef7a566796fe831fffd98b17c940')
options=('staticlibs')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  # Platform files have been copied from here https://github.com/WebAssembly/wasi-sdk
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
    -DWASI_SDK_PREFIX=/usr \
    -DCMAKE_C_FLAGS="-fno-exceptions --sysroot=/usr/share/wasi-sysroot" \
    -DCMAKE_INSTALL_PREFIX=/usr/lib/clang/${pkgver}/ \
    compiler-rt-${pkgver}.src/lib/builtins
  cmake --build build -v
}

package() {
  DESTDIR="${pkgdir}" cmake --install build -v

  install -Dm644 compiler-rt-${pkgver}.src/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
