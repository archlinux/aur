# Maintainer: Markus Näther <naether.markus@gmail.com>
pkgname=rocblas
pkgver=3.3.0
pkgrel=5
pkgdesc='Next generation BLAS implementation for ROCm platform'
arch=('x86_64')
url='https://rocblas.readthedocs.io/en/latest'
license=('MIT')
depends=('hip-hcc' 'openmp')
makedepends=('cmake' 'hcc' 'python' 'python-virtualenv' 'python-pyaml' 'perl-file-which' 'llvm-amdgpu')
_rocblas='https://github.com/ROCmSoftwarePlatform/rocBLAS'
_tensile='https://github.com/ROCmSoftwarePlatform/Tensile'
source=("$pkgname-$pkgver.tar.gz::$_rocblas/archive/rocm-$pkgver.tar.gz"
        "rocm-tensile-$pkgver.tar.gz::$_tensile/archive/rocm-$pkgver.tar.gz")
sha256sums=('aaa8f0479202bdbe94d2ec5655a76055656f743b0d36816501cb84a533084034'
            '25386b26c75fc27234b6a7773b2ac36f1605e82dff8dab5accd8ba842320b6b3')
options=(!strip)

prepare() {
  cd "$srcdir/Tensile-rocm-$pkgver"
  # override __hcc_workweek__
  # https://github.com/rocm-arch/rocm-arch/issues/68#issuecomment-604272120
  sed -i 's/__hcc_workweek__/99999/g' $(grep __hcc_workweek__ . -rIl)
}

build() {
  mkdir -p build
  cd build

  # fix broken build with stack protection
  export CFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CFLAGS")"
  export CXXFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CXXFLAGS")"
  export CPPFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CPPFLAGS")"

  CXX=/opt/rocm/hcc/bin/hcc \
  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/rocblas \
        -DCMAKE_PREFIX_PATH=/opt/rocm/llvm/lib/cmake/llvm \
        -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
        -DDETECT_LOCAL_VIRTUALENV=ON \
        -DTensile_TEST_LOCAL_PATH="$srcdir/Tensile-rocm-$pkgver" \
        -DBUILD_CLIENTS_TESTS=OFF \
        -DBUILD_CLIENTS_BENCHMARKS=OFF \
        -DBUILD_CLIENTS_SAMPLES=OFF \
        "$srcdir/rocBLAS-rocm-$pkgver"

  # Fix for latest llvm
  sed -i 's/Impl::inputOne(io, key, \*value)/Impl::inputOne(io, key.str(), \*value)/g' \
    $srcdir/build/virtualenv/lib/python*/site-packages/Tensile/Source/lib/include/Tensile/llvm/YAML.hpp

  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/rocblas.conf" << EOF
/opt/rocm/rocblas/lib
EOF
  install -Dm644 "$srcdir/rocBLAS-rocm-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
