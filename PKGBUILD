# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=hip-runtime-amd
pkgver=5.0.1
pkgrel=1
pkgdesc="Heterogeneous Interface for Portability ROCm"
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/Installation_Guide/HIP.html'
license=('MIT')
depends=('mesa' 'comgr' 'rocminfo' 'rocm-llvm' 'libelf')
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
        "$pkgname-hipamd-$pkgver.tar.gz::$_hipamd/archive/rocm-$pkgver.tar.gz")
sha256sums=('508555cb068f0c35b930d8f7fc0bb42c64cc555e618434b9135d8d0257ff6977'
            '948bd36e212ce3015540aebc5c8a1741ba7f0a8d5b0d52aba2178bbb202cff84'
            'f7e0fdedf50b1b1378708ce02afd6194dd5df94611dec20e9a5aab95751b3959'
            'f75389b799fc5117452ed74cb4ee2afbb6de93de4367a065851ddc74ea4f9ee3')
_dirhip="$(basename "$_hip")-$(basename "${source[0]}" ".tar.gz")"
_diropencl="$(basename "$_opencl")-$(basename "${source[1]}" ".tar.gz")"
_dirrocclr="$(basename "$_rocclr")-$(basename "${source[2]}" ".tar.gz")"
_dirhipamd="$(basename "$_hipamd")-$(basename "${source[3]}" ".tar.gz")"

build() {
  # build fails if cmake and make are called from outside the build directory
  mkdir build && cd build
  # Pass empty OFFLOAD_ARCH_STR to mitigate a problem with rocm_agent_enumerator (only needed for tests)
  cmake -Wno-dev \
  -S "$srcdir/$_dirhipamd" \
  -DHIP_COMMON_DIR="$srcdir/$_dirhip" \
  -DAMD_OPENCL_PATH="$srcdir/$_diropencl" \
  -DROCCLR_PATH="$srcdir/$_dirrocclr" \
  -DHIP_PLATFORM=amd \
  -DOFFLOAD_ARCH_STR='' \
  -DCMAKE_INSTALL_PREFIX=/opt/rocm/hip

  make
}

package() {
  DESTDIR="$pkgdir" make -C build install

  # add links (hipconfig is for rocblas with tensile)
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/opt/rocm/bin"
  local _fn
  for _fn in hipcc hipconfig hipcc.pl hipconfig.pl; do
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
