# Maintainer: Clément Le Goffic <legoffic.clement@gmail.com>
pkgname=baremetal-compiler-rt
pkgver=22.1.1
pkgrel=1
pkgdesc="compiler-rt builtins for bare-metal ARM Cortex-M targets (armv7m, armv7em, armv8m.main, armv8.1m.main)"
arch=('x86_64')
url="https://github.com/llvm/llvm-project"
license=('Apache-2.0 WITH LLVM-exception')
makedepends=('clang' 'llvm' 'cmake' 'ninja' 'python' 'arm-none-eabi-newlib')
options=('!strip' '!debug')
_arches=(armv7m armv7em armv8m.main armv8.1m.main)
source=(
  "https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz"
)

sha256sums=('9c6f37f6f5f68d38f435d25f770fc48c62d92b2412205767a16dac2c942f0c95')

build() {
  local _sysroot=/usr/arm-none-eabi
  local _llvm_srcdir="${srcdir}/llvm-project-${pkgver}.src"

  for _arch in "${_arches[@]}"; do
    cmake -S "${_llvm_srcdir}/compiler-rt" \
          -B "${srcdir}/build-${_arch}" \
          -G Ninja \
          -DLLVM_COMMON_CMAKE_UTILS="${_llvm_srcdir}/cmake" \
          -DLLVM_MAIN_SRC_DIR="${_llvm_srcdir}/llvm" \
          -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
          -DCOMPILER_RT_OS_DIR=baremetal \
          -DCOMPILER_RT_BUILD_BUILTINS=ON \
          -DCOMPILER_RT_BUILD_SANITIZERS=OFF \
          -DCOMPILER_RT_BUILD_XRAY=OFF \
          -DCOMPILER_RT_BUILD_LIBFUZZER=OFF \
          -DCOMPILER_RT_BUILD_PROFILE=OFF \
          -DCOMPILER_RT_BAREMETAL_BUILD=ON \
          -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
          -DCOMPILER_RT_INCLUDE_TESTS=OFF \
          -DCMAKE_C_COMPILER=/usr/bin/clang \
          -DCMAKE_C_COMPILER_TARGET="${_arch}-none-eabi" \
          -DCMAKE_ASM_COMPILER_TARGET="${_arch}-none-eabi" \
          -DCMAKE_AR=/usr/bin/llvm-ar \
          -DCMAKE_NM=/usr/bin/llvm-nm \
          -DCMAKE_RANLIB=/usr/bin/llvm-ranlib \
          -DCMAKE_C_FLAGS="-march=${_arch} -mthumb -mfpu=none -mfloat-abi=soft -I${_sysroot}/include" \
          -DCMAKE_ASM_FLAGS="-march=${_arch} -mthumb -mfpu=none -mfloat-abi=soft -I${_sysroot}/include"

    ninja -C "${srcdir}/build-${_arch}" builtins
  done
}

package() {
  local _resourcedir
  local _llvm_srcdir="${srcdir}/llvm-project-${pkgver}.src"
  _resourcedir=$(clang -print-resource-dir)

  for _arch in "${_arches[@]}"; do
    install -Dm644 \
      "${srcdir}/build-${_arch}/lib/baremetal/libclang_rt.builtins-${_arch}.a" \
      "${pkgdir}${_resourcedir}/lib/baremetal/libclang_rt.builtins-${_arch}.a"
  done

  install -Dm644 "${_llvm_srcdir}/compiler-rt/LICENSE.TXT" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
