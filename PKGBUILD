# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=hip-runtime-amd
pkgver=4.5.0
pkgrel=2
pkgdesc="Heterogeneous Interface for Portability ROCm"
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/Installation_Guide/HIP.html'
license=('MIT')
depends=('mesa' 'comgr' 'rocminfo' 'libelf')
makedepends=('cmake' 'python' 'git')
provides=('hip')
conflicts=('hip')
_hip='https://github.com/ROCm-Developer-Tools/HIP'
_opencl='https://github.com/RadeonOpenCompute/ROCm-OpenCL-Runtime'
_rocclr='https://github.com/ROCm-Developer-Tools/ROCclr'
_hipamd='https://github.com/ROCm-Developer-Tools/hipamd'
source=("$pkgname-$pkgver.tar.gz::$_hip/archive/rocm-$pkgver.tar.gz"
        "$pkgname-opencl-$pkgver.tar.gz::$_opencl/archive/rocm-$pkgver.tar.gz"
        "$pkgname-rocclr-$pkgver.tar.gz::$_rocclr/archive/rocm-$pkgver.tar.gz"
        "$pkgname-hipamd-$pkgver.tar.gz::$_hipamd/archive/rocm-$pkgver.tar.gz"
        'disable-testing.patch'
        'vector_oob.patch')
sha256sums=('4026f31fb4f8050e9aa9d4294f29c3410bfb38422dbbae4236ccd65fed4d55b2'
            '3a163aed24619b3faf5e8ba17325bdcedd1667a904ea20914ac6bdd33fcdbca8'
            'ca8d6305ff0e620d9cb69ff7ac3898917db9e9b6996a7320244b48ab6511dd8e'
            '7b93ab64d6894ff9b5ba0be35e3ed8501d6b18a2a14223d6311d72ab8a9cdba6'
            '3f158fb78296477db176c53a8df60b8034004c400b6c62f558c94663a5246883'
            '8295e2d1b1d48da821f280e6a44f8376cbe73b77bd58bdceed38dbc2a100569f')
_dirhip="$(basename "$_hip")-$(basename "${source[0]}" ".tar.gz")"
_diropencl="$(basename "$_opencl")-$(basename "${source[1]}" ".tar.gz")"
_dirrocclr="$(basename "$_rocclr")-$(basename "${source[2]}" ".tar.gz")"
_dirhipamd="$(basename "$_hipamd")-$(basename "${source[3]}" ".tar.gz")"

prepare() {
  cd "$_dirhipamd"
  # Tests are broken with cmake 3.21
  patch -Np1 -i "$srcdir/disable-testing.patch"
  cd "$srcdir/$_dirrocclr"
  # https://github.com/ROCm-Developer-Tools/HIP/issues/2426
  patch -Np1 -i "$srcdir/vector_oob.patch"
}

build() {
  mkdir build && cd build
  cmake -Wno-dev \
  -S "$srcdir/$_dirhipamd" \
  -DHIP_COMMON_DIR="$srcdir/$_dirhip" \
  -DAMD_OPENCL_PATH="$srcdir/$_diropencl" \
  -DROCCLR_PATH="$srcdir/$_dirrocclr" \
  -DHIP_PLATFORM=amd \
  -DCMAKE_INSTALL_PREFIX=/opt/rocm/hip

  make
}

package() {
  DESTDIR="$pkgdir" make -C build install

  # add links (hipconfig is for rocblas with tensile)
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/opt/rocm/bin"
  local _fn
  for _fn in hipcc hipconfig; do
    ln -s "/opt/rocm/hip/bin/$_fn" "$pkgdir/usr/bin/$_fn"
    ln -s "/opt/rocm/hip/bin/$_fn" "$pkgdir/opt/rocm/bin/$_fn"
  done
 
  # clang from llvm-amdgpu may look for hipVersion in a different directory
  ln -s '/opt/rocm/hip/bin/.hipVersion' "$pkgdir/opt/rocm/bin/.hipVersion"
  # Same holds for the HIP library
  install -d "$pkgdir/opt/rocm/lib"
  ln -s "/opt/rocm/hip/lib/libamdhip64.so" "$pkgdir/opt/rocm/lib/libamdhip64.so"

  # Some packages search for hip includes in /opt/rocm/include
  install -d "$pkgdir/opt/rocm/include"
  ln -s "/opt/rocm/hip/include/hip" "$pkgdir/opt/rocm/include/hip"

  # CMake projects with language "HIP" look for hip config files in /opt/rocm/lib
  install -d "$pkgdir/opt/rocm/lib/cmake"
  ln -s "/opt/rocm/hip/lib/cmake/hip" "$pkgdir/opt/rocm/lib/cmake/hip"
  ln -s "/opt/rocm/hip/lib/cmake/hip-lang" "$pkgdir/opt/rocm/lib/cmake/hip-lang"

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/hip.conf" <<EOF
/opt/rocm/hip/lib
EOF
  install -Dm644 "$srcdir/HIP-rocm-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
