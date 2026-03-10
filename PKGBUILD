# Maintainer: Clément Le Goffic <legoffic.clement@gmail.com>
pkgname=unwind-baremetal-compiler-rt
pkgver=21.1.8
pkgrel=1
pkgdesc="libunwind for bare-metal ARM Cortex-M targets (armv7m, armv7em, armv8m.main, armv8.1m.main)"
arch=('x86_64')
url="https://github.com/llvm/llvm-project"
license=('Apache-2.0 WITH LLVM-exception')
makedepends=('clang' 'llvm' 'cmake' 'ninja' 'arm-none-eabi-newlib')
options=('!strip' '!debug')
_arches=(armv7m armv7em armv8m.main armv8.1m.main)
source=(
  "https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz"
)
sha256sums=('4633a23617fa31a3ea51242586ea7fb1da7140e426bd62fc164261fe036aa142')

build() {
  local _clang_major="${pkgver%%.*}"
  local _resourcedir="/usr/lib/clang/${_clang_major}"

  for _arch in "${_arches[@]}"; do
    cmake -S "${srcdir}/llvm-project-${pkgver}.src/libunwind" \
          -B "${srcdir}/build-${_arch}" \
          -G Ninja \
          -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
          -DLIBUNWIND_IS_BAREMETAL=ON \
          -DLIBUNWIND_ENABLE_SHARED=OFF \
          -DLIBUNWIND_ENABLE_STATIC=ON \
          -DLIBUNWIND_ENABLE_THREADS=OFF \
          -DLIBUNWIND_USE_COMPILER_RT=ON \
          -DLIBUNWIND_INCLUDE_TESTS=OFF \
          -DLIBUNWIND_INCLUDE_DOCS=OFF \
          -DLIBUNWIND_INSTALL_HEADERS=OFF \
          -DCMAKE_SYSROOT=/usr/arm-none-eabi \
          -DCMAKE_C_COMPILER=clang \
          -DCMAKE_CXX_COMPILER=clang++ \
          -DCMAKE_C_COMPILER_TARGET="${_arch}-none-eabi" \
          -DCMAKE_CXX_COMPILER_TARGET="${_arch}-none-eabi" \
          -DCMAKE_AR=/usr/bin/llvm-ar \
          -DCMAKE_NM=/usr/bin/llvm-nm \
          -DCMAKE_RANLIB=/usr/bin/llvm-ranlib \
          -DCMAKE_C_FLAGS="-march=${_arch} -mthumb -mfpu=none -mfloat-abi=soft -ffile-prefix-map=${srcdir}=" \
          -DCMAKE_CXX_FLAGS="-march=${_arch} -mthumb -mfpu=none -mfloat-abi=soft -fno-exceptions -fno-rtti -ffile-prefix-map=${srcdir}=" \
          -DCMAKE_BUILD_TYPE=MinSizeRel

    ninja -C "${srcdir}/build-${_arch}" unwind_static
  done
}

package() {
  local _clang_major="${pkgver%%.*}"
  local _resourcedir="/usr/lib/clang/${_clang_major}"

  for _arch in "${_arches[@]}"; do
    install -Dm644 \
      "${srcdir}/build-${_arch}/lib/libunwind.a" \
      "${pkgdir}${_resourcedir}/lib/baremetal/libunwind-${_arch}.a"
  done

  install -Dm644 "${srcdir}/llvm-project-${pkgver}.src/libunwind/LICENSE.TXT" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
