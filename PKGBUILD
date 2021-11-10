# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel at yahoo dot com>

pkgname=miopen-opencl
pkgver=4.5.0
pkgrel=1
pkgdesc="AMD's Machine Intelligence Library (OpenCL backend)"
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/MIOpen"
license=('MIT')
depends=('ocl-icd' 'rocblas' 'llvm-amdgpu')
makedepends=('opencl-headers' 'rocm-cmake' 'cmake' 'miopengemm')
provides=('miopen')
conflicts=('miopen')
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('be2f5ce962e15e62d427978422498c0ddf821b91fd40777a1ba915a2794d6fda')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

build() {
  cd "$_dirname"

  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-4.5.x/docs/markdown/clang_options.md
  # -fPIC fixes linking errors with boost.
  export CXX=/opt/rocm/llvm/bin/clang++
  export CXXFLAGS="${CXXFLAGS} -fcf-protection=none -fPIC"

  cmake -P install_deps.cmake \
        --minimum --prefix "$srcdir/deps"

  CXX=/opt/rocm/llvm/bin/clang++ \
  cmake -B build -Wno-dev \
        -DMIOPEN_BACKEND=OpenCL \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DCMAKE_PREFIX_PATH=/opt/rocm \
        -DCMAKE_PREFIX_PATH="$srcdir/deps"

  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C "$_dirname/build" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/miopen.conf"
/opt/rocm/miopen/lib
EOF

  install -Dm644 "$srcdir/$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
