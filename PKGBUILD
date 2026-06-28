# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=libint
pkgname=libint2
pkgver=2.13.1
pkgrel=1
pkgdesc='A high-performance library for computing Gaussian integrals in quantum mechanics'
url='https://github.com/evaleev/libint'
license=(GPL-3.0-only LGPL-3.0-only)
arch=(x86_64 aarch64)
depends=(boost)
makedepends=(cmake ninja clang gcc-fortran eigen python pybind11)
source=($pkgname-$pkgver.tar.gz::"https://github.com/evaleev/libint/archive/v$pkgver.tar.gz"
        destdir.patch)
sha256sums=('9651705c79f77418ef0230aafc0cf1b71b17c1c89e413ee0e5ee7818650ce978'
            '5747eab346555ebd272adf0c4b18f24e76a504e262bd0321c3a8167f2b5406cb')
options=(!buildflags)

prepare() {
  # make basis.h install honour DESTDIR
  patch -p1 -d "$_pkgname-$pkgver" < destdir.patch

  # FMA intrinsics are an x86_64-only feature; on aarch64 fused multiply-add
  # is part of the base ISA and is emitted by the compiler automatically.
  if [ "$CARCH" == 'x86_64' ] && clang -march=native -dM -E - < /dev/null | grep -q '__FMA__'; then
    FMA=ON
    CXXFLAGS="-O2 -mfma"
    FCFLAGS="-O2 -mfma"
    echo "Support of FMA intrinsics is enabled"
  else
    FMA=OFF
    CXXFLAGS="-O2"
    FCFLAGS="-O2"
    echo "Support of FMA intrinsics is disabled"
  fi
}

build() {
  local compiler_build="$srcdir/build_compiler"
  # cap parallelism: some integral TUs need ~3 GB RAM each
  local jobs=$(( $(nproc) < 4 ? $(nproc) : 4 ))

  # build compiler, export library source
  cmake \
    -B "$compiler_build" \
    -S "$_pkgname-$pkgver" \
    -G Ninja \
    -D CMAKE_C_COMPILER=clang \
    -D CMAKE_CXX_COMPILER=clang++ \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS" \
    -D LIBINT2_ENABLE_ERI=1 \
    -D LIBINT2_ENABLE_ERI2=1 \
    -D LIBINT2_ENABLE_ERI3=1 \
    -D LIBINT2_GENERATE_FMA=$FMA \
    -D LIBINT2_MAX_AM=5 \
    -D LIBINT2_ERI_MAX_AM="5;4" \
    -D LIBINT2_ERI2_MAX_AM="7;6" \
    -D LIBINT2_ERI3_MAX_AM="7;6" \
    -D LIBINT2_OPT_AM=3 \
    -W no-dev
  cmake --build "$compiler_build" --target export

  # build from staging tree (tarball racy under -j)
  cd "$compiler_build"/libint-*/
  cmake \
    -B build \
    -S . \
    -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_C_COMPILER=clang \
    -D CMAKE_CXX_COMPILER=clang++ \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS" \
    -D CMAKE_Fortran_FLAGS="$FCFLAGS" \
    -D CMAKE_UNITY_BUILD_BATCH_SIZE=1 \
    -D LIBINT2_ENABLE_FORTRAN=ON \
    -D LIBINT2_ENABLE_PYTHON=ON \
    -D BUILD_SHARED_LIBS=ON \
    -W no-dev
  cmake --build build -j"$jobs"
}

check() {
  local jobs=$(( $(nproc) < 4 ? $(nproc) : 4 ))
  cd "$srcdir"/build_compiler/libint-*/
  cmake --build build --target check -j"$jobs"
}

package() {
  cd "$srcdir"/build_compiler/libint-*/
  DESTDIR="$pkgdir" cmake --install build
}
