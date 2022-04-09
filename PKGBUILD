# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=hip-runtime-nvidia
pkgver=5.1.0
pkgrel=2
pkgdesc="Heterogeneous Interface for Portability ROCm"
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/Installation_Guide/HIP.html'
license=('MIT')
depends=('cuda' 'rocm-llvm')
makedepends=('libelf' 'cmake' 'python' 'git')
provides=('hip')
conflicts=('hip')
_hip='https://github.com/ROCm-Developer-Tools/HIP'
_hipamd='https://github.com/ROCm-Developer-Tools/hipamd'
source=("$pkgname-$pkgver.tar.gz::$_hip/archive/rocm-$pkgver.tar.gz"
        "$pkgname-hipamd-$pkgver.tar.gz::$_hipamd/archive/rocm-$pkgver.tar.gz"
        "nvcc.patch::https://patch-diff.githubusercontent.com/raw/ROCm-Developer-Tools/HIP/pull/2623.patch"
        "git-hash.patch")
sha256sums=('47e542183699f4005c48631d96f6a1fbdf27e07ad3402ccd7b5f707c2c602266'
            '77984854bfe00f938353fe4c7604d09967eaf5c609d05f1e6423d3c3dea86e61'
            'SKIP'
            '84cd40751e041edd48489eca59f1702bba08a402b25162e4cf061de45abc2bde')
_dirhip="$(basename "$_hip")-$(basename "${source[0]}" ".tar.gz")"
_dirhipamd="$(basename "$_hipamd")-$(basename "${source[1]}" ".tar.gz")"

prepare() {
    cd "$_dirhipamd"
    patch -Np1 -i "$srcdir/git-hash.patch"

    cd "$srcdir/$_dirhip"
    patch -Np1 -i "$srcdir/nvcc.patch"
}

build() {
  # build fails if cmake and make are called from outside the build directory
  mkdir build && cd build
  cmake -Wno-dev \
  -S "$srcdir/$_dirhipamd" \
  -DHIP_COMMON_DIR="$srcdir/$_dirhip" \
  -DHIP_PLATFORM=nvidia \
  -DCMAKE_INSTALL_PREFIX=/opt/rocm/hip \
  -DCMAKE_HIP_ARCHITECTURES='sm_70;sm72;sm_75;sm_80;sm_86'

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

  # CMake projects with language "HIP" look for hip config files in /opt/rocm/lib
  install -d "$pkgdir/opt/rocm/lib/cmake"
  ln -s "/opt/rocm/hip/lib/cmake/hip" "$pkgdir/opt/rocm/lib/cmake/hip"
  ln -s "/opt/rocm/hip/lib/cmake/hip-lang" "$pkgdir/opt/rocm/lib/cmake/hip-lang"

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/hip.conf" <<EOF
/opt/rocm/lib
EOF
  install -Dm644 "$srcdir/$_dirhip/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
