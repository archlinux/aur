# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=hip-runtime-nvidia
pkgver=4.5.2
pkgrel=1
pkgdesc="Heterogeneous Interface for Portability ROCm"
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/Installation_Guide/HIP.html'
license=('MIT')
makedepends=('libelf' 'cmake' 'git')
depends=('cuda' 'llvm-amdgpu')
provides=('hip')
conflicts=('hip')
_hip='https://github.com/ROCm-Developer-Tools/HIP'
_hipamd='https://github.com/ROCm-Developer-Tools/hipamd'
source=("$pkgname-$pkgver.tar.gz::$_hip/archive/rocm-$pkgver.tar.gz"
        "$pkgname-hipamd-$pkgver.tar.gz::$_hipamd/archive/rocm-$pkgver.tar.gz"
        'disable-testing.patch')
sha256sums=('c2113dc3c421b8084cd507d91b6fbc0170765a464b71fb0d96bb875df368f160'
            'b6f35b1a1d0c466b5af28e26baf646ae63267eccc4852204db1e0c7222a39ce2'
            '3f158fb78296477db176c53a8df60b8034004c400b6c62f558c94663a5246883')
_dirhip="$(basename "$_hip")-$(basename "${source[0]}" ".tar.gz")"
_dirhipamd="$(basename "$_hipamd")-$(basename "${source[1]}" ".tar.gz")"

prepare() {
  cd "$_dirhipamd"
  # Tests are broken with cmake 3.21
  patch -Np1 -i "$srcdir/disable-testing.patch"
}

build() {
  mkdir build && cd build
  cmake -Wno-dev \
        -S "$srcdir/$_dirhipamd" \
        -DHIP_COMMON_DIR="$srcdir/$_dirhip" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DCMAKE_HIP_ARCHITECTURES='sm_70;sm72;sm_75;sm_80;sm_86' \
        -DHIP_PLATFORM=nvidia \
        "$srcdir/HIP-rocm-$pkgver"
  make
}

package() {
  DESTDIR="$pkgdir" make -C build install

  # add links (hipconfig is for rocblas with tensile)
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in hipcc hipconfig; do
    ln -s "/opt/rocm/bin/$_fn" "$pkgdir/usr/bin/$_fn"
  done

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/hip.conf" <<EOF
/opt/rocm/lib
EOF
  install -Dm644 "$srcdir/$_dirhip/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
