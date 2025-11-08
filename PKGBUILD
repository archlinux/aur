pkgname=('flang')
pkgver=21.1.5
pkgrel=1
pkgdesc="ground-up implementation of a Fortran front end written in modern C++"
arch=('x86_64')
url="http://llvm.org/"
license=('Apache-2.0 WITH LLVM-Exception')
depends=("mlir>=${pkgver%%.*}" "clang" "llvm-libs")
makedepends=('cmake' 'python' 'llvm')
options=(staticlibs)
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/flang-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/clang-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-project-$pkgver.src.tar.xz{,.sig})
sha256sums=('e60f5c440966364f763c5162c2c33a28cd5e0872d08ee1ef638ec19295ab1ce0'
            'SKIP'
            '48013d5714a96419bf993a2e5e4c5827377e8cf9c565070731fb2305d50d9511'
            'SKIP'
            'eee4de3b3f01ea6dd6b0936ac8be319eef0a65d0022def258c70110e3743807c'
            'SKIP'
            '1794be4bf974e99a3fe1da4b2b9b1456c02ae9479c942f365441d8d207bd650c'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85') # Cullen Rhodes <cullen.rhodes@arm.com>

prepare() {
  cp -r clang{-$pkgver.src,}
  cp -r cmake{-$pkgver.src,}
}

build() {
  # flang standalone build
  cd flang-$pkgver.src
  export CXXFLAGS="${CXXFLAGS} -Wp,-U_GLIBCXX_ASSERTIONS"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCLANG_DIR=/usr/lib/cmake/clang/ \
    -DMLIR_TABLEGEN_EXE=/usr/bin/mlir-tblgen \
    -DFLANG_INCLUDE_TESTS=OFF \
    -B build -S .
  cmake --build build --parallel 1

  # flang-rt standalone build
  cd "$srcdir"/llvm-project-$pkgver.src/flang-rt
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_Fortran_COMPILER="$srcdir"/flang-$pkgver.src/build/bin/flang \
    -DCMAKE_Fortran_COMPILER_WORKS=yes \
    -DFLANG_RT_INCLUDE_TESTS=OFF \
    -DLLVM_ENABLE_RUNTIMES="flang-rt" \
    -B build -S "$srcdir"/llvm-project-$pkgver.src/runtimes
  cmake --build build
}

package() {
  cd flang-$pkgver.src
  DESTDIR="${pkgdir}" cmake --install build
  cd ../llvm-project-$pkgver.src/flang-rt
  DESTDIR="${pkgdir}" cmake --install build

  # move runtime dir to match flang linker flags -L/usr/lib/clang/21/lib/linux, see flang-rt/cmake/modules/GetToolchainDirs.cmake
  mv -v "${pkgdir}"/usr/lib/clang/${pkgver%%.*}/lib/*-unknown-linux-gnu/ "${pkgdir}"/usr/lib/clang/${pkgver%%.*}/lib/linux
}
