# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=hip-runtime-nvidia
pkgver=5.2.1
pkgrel=1
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
        "git-hash.patch"
        "config-path.patch::https://patch-diff.githubusercontent.com/raw/ROCm-Developer-Tools/hipamd/pull/32.patch"
        "nvcc.patch::https://patch-diff.githubusercontent.com/raw/ROCm-Developer-Tools/HIP/pull/2623.patch")
sha256sums=('7d4686a2f8a9124bb21f7f3958e451c57019f48a0cbb42ffdc56ed02860a46c3'
            '4feaa3883cbc54ddcd5d2d5becbe0f3fe3edd5b3b468dc73b5104893029eefac'
            '84cd40751e041edd48489eca59f1702bba08a402b25162e4cf061de45abc2bde'
            'SKIP'
            'SKIP')
_dirhip="$(basename "$_hip")-$(basename "${source[0]}" ".tar.gz")"
_dirhipamd="$(basename "$_hipamd")-$(basename "${source[1]}" ".tar.gz")"

prepare() {
    cd "$_dirhipamd"
    patch -Np1 -i "$srcdir/git-hash.patch"
    patch -N   -i "$srcdir/config-path.patch"

    cd "$srcdir/$_dirhip"
    patch -Np1 -i "$srcdir/nvcc.patch"
}

build() {
  local cmake_args=(-DHIP_COMMON_DIR="$srcdir/$_dirhip" \
                    -DHIP_PLATFORM=nvidia \
                    -DCMAKE_INSTALL_PREFIX=/opt/rocm)

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
  local _fn
  for _fn in hipcc hipconfig hipcc.pl hipconfig.pl; do
    ln -s "/opt/rocm/hip/bin/$_fn" "$pkgdir/usr/bin/$_fn"
  done

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/hip.conf" <<EOF
/opt/rocm/lib
EOF
  install -Dm644 "$srcdir/$_dirhip/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
