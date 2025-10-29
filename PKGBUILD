pkgname=('flang')
pkgver=21.1.4
pkgrel=1
pkgdesc="ground-up implementation of a Fortran front end written in modern C++"
arch=('x86_64')
url="http://llvm.org/"
license=('Apache-2.0 WITH LLVM-Exception')
depends=("mlir>=${pkgver%%.*}" "clang" "llvm-libs")
makedepends=('cmake' 'python' 'llvm')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/flang-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/clang-$pkgver.src.tar.xz{,.sig})
sha256sums=('19c7b13239c548640ff09d4ccf86ed2696ffe82eed4999a1de1a5c3332ebe3a9'
            'SKIP'
            'f4316d84a862ba3023ca1d26bd9c6a995516b4fa028b6fb329d22e24cc6d235e'
            'SKIP'
            '3e8e25a7478bfb0ef510fff35d1a43bdfb62c7727bf98bb43ad33deef2f9f1a2'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85') # Cullen Rhodes <cullen.rhodes@arm.com>

prepare() {
  cd flang-$pkgver.src
}

build() {
  cp -r clang{-$pkgver.src,}
  cp -r cmake{-$pkgver.src,}
  cd flang-$pkgver.src
  export CXXFLAGS="${CXXFLAGS} -Wp,-U_GLIBCXX_ASSERTIONS"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCLANG_DIR=/usr/lib/cmake/clang/ \
    -DMLIR_TABLEGEN_EXE=/usr/bin/mlir-tblgen \
    -DFLANG_INCLUDE_TESTS=OFF \
    -B build -S .
  cmake --build build
}

package() {
  cd flang-$pkgver.src
  DESTDIR="${pkgdir}" cmake --install build
}
