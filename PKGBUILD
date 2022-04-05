# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=hip-runtime-amd
pkgver=5.1.0
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
        "$pkgname-hipamd-$pkgver.tar.gz::$_hipamd/archive/rocm-$pkgver.tar.gz"
        "git-hash.patch")
sha256sums=('47e542183699f4005c48631d96f6a1fbdf27e07ad3402ccd7b5f707c2c602266'
            '362d81303048cf7ed5d2f69fb65ed65425bc3da4734fff83e3b8fbdda51b0927'
            'f4f265604b534795a275af902b2c814f416434d9c9e16db81b3ed5d062187dfa'
            '77984854bfe00f938353fe4c7604d09967eaf5c609d05f1e6423d3c3dea86e61'
            '84cd40751e041edd48489eca59f1702bba08a402b25162e4cf061de45abc2bde')
_dirhip="$(basename "$_hip")-$(basename "${source[0]}" ".tar.gz")"
_diropencl="$(basename "$_opencl")-$(basename "${source[1]}" ".tar.gz")"
_dirrocclr="$(basename "$_rocclr")-$(basename "${source[2]}" ".tar.gz")"
_dirhipamd="$(basename "$_hipamd")-$(basename "${source[3]}" ".tar.gz")"

prepare() {
    cd "$_dirhipamd"
    patch -Np1 -i "$srcdir/git-hash.patch"
}

build() {
  local cmake_args=(-DHIP_COMMON_DIR="$srcdir/$_dirhip"
                    -DHIP_COMMON_DIR="$srcdir/$_dirhip"
                    -DAMD_OPENCL_PATH="$srcdir/$_diropencl"
                    -DROCCLR_PATH="$srcdir/$_dirrocclr"
                    -DHIP_PLATFORM=amd
                    -DCMAKE_INSTALL_PREFIX=/opt/rocm/hip)
  if [[ -n "$AMDGPU_TARGETS" ]]; then
      cmake_args+=(-DAMDGPU_TARGETS="${AMDGPU_TARGETS}")
  fi

  # build fails if cmake and make are called from outside the build directory
  mkdir build && cd build
  cmake -Wno-dev \
  -S "$srcdir/$_dirhipamd" \
  "${cmake_args[@]}"

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
