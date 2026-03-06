# Maintainer: Clément Le Goffic <legoffic.clement@gmail.com>
pkgname=baremetal-compiler-rt
pkgver=21.1.8
pkgrel=1
pkgdesc="compiler-rt builtins for bare-metal ARM Cortex-M targets (armv7m, armv7em, armv8m.main, armv8.1m.main)"
arch=('x86_64')
url="https://github.com/llvm/llvm-project"
license=('Apache-2.0 WITH LLVM-exception')
makedepends=('clang' 'llvm' 'cmake' 'ninja' 'python' 'arm-none-eabi-newlib')
options=('!strip' '!debug')
_arches=(armv7m armv7em armv8m.main armv8.1m.main)
source=(
  "https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/compiler-rt-${pkgver}.src.tar.xz"
  "https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/cmake-${pkgver}.src.tar.xz"
  "https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-${pkgver}.src.tar.xz"
)

sha256sums=('dd54ae21aee1780fac59445b51ebff601ad016b31ac3a7de3b21126fd3ccb229'
            '85735f20fd8c81ecb0a09abb0c267018475420e93b65050cc5b7634eab744de9'
            'd9022ddadb40a15015f6b27e6549a7144704ded8828ba036ffe4b8165707de21')

prepare() {
  # The compiler-rt CMake checks for a sibling llvm/ directory (monorepo
  # layout). Create a symlink so the check finds our versioned llvm source.
  ln -sf "llvm-${pkgver}.src" "${srcdir}/llvm"
}

build() {
  local _sysroot=/usr/arm-none-eabi

  for _arch in "${_arches[@]}"; do
    cmake -S "${srcdir}/compiler-rt-${pkgver}.src" \
          -B "${srcdir}/build-${_arch}" \
          -G Ninja \
          -DLLVM_COMMON_CMAKE_UTILS="${srcdir}/cmake-${pkgver}.src" \
          -DLLVM_MAIN_SRC_DIR="${srcdir}/llvm-${pkgver}.src" \
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
  _resourcedir=$(clang -print-resource-dir)

  for _arch in "${_arches[@]}"; do
    install -Dm644 \
      "${srcdir}/build-${_arch}/lib/baremetal/libclang_rt.builtins-${_arch}.a" \
      "${pkgdir}${_resourcedir}/lib/baremetal/libclang_rt.builtins-${_arch}.a"
  done

  install -Dm644 "${srcdir}/compiler-rt-${pkgver}.src/LICENSE.TXT" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
