# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=hip-runtime-nvidia
pkgver=5.0.2
pkgrel=1
pkgdesc="Heterogeneous Interface for Portability ROCm"
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/Installation_Guide/HIP.html'
license=('MIT')
makedepends=('libelf' 'cmake' 'git')
depends=('cuda' 'rocm-llvm')
provides=('hip')
conflicts=('hip')
_hip='https://github.com/ROCm-Developer-Tools/HIP'
_hipamd='https://github.com/ROCm-Developer-Tools/hipamd'
source=("$pkgname-$pkgver.tar.gz::$_hip/archive/rocm-$pkgver.tar.gz"
        "$pkgname-hipamd-$pkgver.tar.gz::$_hipamd/archive/rocm-$pkgver.tar.gz")
sha256sums=('e23601e6f4f62083899ea6356fffbe88d1deb20fa61f2c970e3c0474cd8886ca'
            '80e7268dd22eba0f2f9222932480dede1d80e56227c0168c6a0cc8e4f23d3b76')
_dirhip="$(basename "$_hip")-$(basename "${source[0]}" ".tar.gz")"
_dirhipamd="$(basename "$_hipamd")-$(basename "${source[1]}" ".tar.gz")"

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
