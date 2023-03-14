_compiler=clang
pkgname=mlir
pkgver=15.0.7
_url=https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}
_file=llvm-project-${pkgver}.src.tar.xz
pkgrel=1
pkgdesc="Multi-Level IR Compiler Framework for LLVM"
arch=('x86_64')
url="https://mlir.llvm.org/"
license=("custom:Apache 2.0 with LLVM Exception")
depends=("llvm=$pkgver")
makedepends=("cmake"
             "ninja"
             "python-sphinx"
             $([[ "$_compiler" == "clang" ]] && echo \
               "compiler-rt" \
               "libc++")
             $([[ "$_compiler" == "gcc" ]] && echo \
               "gcc")
             )
options=('!debug' 'strip')
# No source package for MLIR: https://bugs.llvm.org/show_bug.cgi?id=52248
source=("${_url}/${_file}")
sha256sums=('8b5fcb24b4128cf04df1b0b9410ce8b1a729cb3c544e6da885d234280dedeac6')
noextract=(llvm-project-${pkgver}.src.tar.xz)

prepare() {
  # Extracting llvm-project.src.tar.xz due to symlink(s) without pre-existing target(s)
  cd "${srcdir}"
  [[ -d mlir ]] && rm -rf mlir
  tar --strip-components=1 -xJf ${srcdir}/${_file} -C ${srcdir} || true
}

build() {
  cd "${srcdir}"
  [[ -d build-${CARCH} ]] && rm -rf build-${CARCH}
  mkdir -p build-${CARCH} && cd build-${CARCH}

  if check_option "debug" "y"; then
    _build_type="Debug"
  else
    _build_type="Release"
  fi

  cmake \
    -GNinja \
    -DCMAKE_BUILD_TYPE=${_build_type} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SYSTEM_IGNORE_PATH=/usr/lib \
    -DLLVM_HOST_TRIPLE="${CARCH}-w64-windows-gnu" \
    -DPython3_EXECUTABLE=/usr/bin/python \
    -DPython3_FIND_REGISTRY=NEVER \
    -DPython3_ROOT_DIR=/usr \
    -DLLVM_ENABLE_SPHINX=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DMLIR_LINK_MLIR_DYLIB=ON \
    -DLLVM_BUILD_TOOLS=ON \
    -DLLVM_BUILD_UTILS=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_PIC=ON \
    -DMLIR_INCLUDE_TESTS=ON \
    -Wno-dev \
    ../$pkgname

  cmake --build .
}

package() {
  DESTDIR="${pkgdir}" cmake --install build-${CARCH}

  install -d "$pkgdir"/usr/share/licenses/${pkgname}
  install -Dm644 ${srcdir}/${pkgname}/LICENSE* -t "$pkgdir"/usr/share/licenses/${pkgname}
}
