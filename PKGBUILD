# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=hip-nvcc
pkgver=3.5.1
pkgrel=3
pkgdesc="Heterogeneous Interface for Portability ROCm"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/HIP"
license=('MIT')
makedepends=('libelf' 'cmake')
depends=('cuda')
provides=('hip')
conflicts=('hip')
_git='https://github.com/ROCm-Developer-Tools/HIP'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz"
        "hipinfo.patch")
sha256sums=('f91cf5ef846b6b916d0258a967b6cb63e236dd777eb0e01c88337d72b5bde000'
            'f94d8b2426d5f8eecd420698a2b7f3d66ddc0531afe313a572f0b644f6e45b64')

prepare() {
  cd "${srcdir}/HIP-rocm-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/hipinfo.patch"
}

build() {
  cmake -B build -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/hip \
        -DHIP_PLATFORM=nvcc \
        -DHIP_COMPILER=clang \
        "$srcdir/HIP-rocm-$pkgver"
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  # add links (hipconfig is for rocblas with tensile)
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in hipcc hipconfig; do
    ln -s "/opt/rocm/hip/bin/$_fn" "$pkgdir/usr/bin/$_fn"
  done

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/hip.conf" <<EOF
/opt/rocm/hip/lib
EOF
  install -Dm644 "$srcdir/HIP-rocm-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
