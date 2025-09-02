# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=gdrcopy
pkgver=2.5.1
pkgrel=1
pkgdesc="A fast GPU memory copy library based on NVIDIA GPUDirect RDMA technology."
arch=('x86_64')
url="https://github.com/NVIDIA/gdrcopy"
license=('MIT')
depends=('nvidia-open' 'cuda')
makedepends=('make' 'gcc' 'linux-headers' 'nvidia-open-dkms' 'zstd')
options=(!strip staticlibs)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c6d5ebb7dabb89d798f27609511735595004da73af28d93ac041bb5290c4cbec')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/MIT/GPL/g' scripts/test_gdrdrv_HAVE_VM_FLAGS_SET.sh
}

build() {
  cd $pkgname-$pkgver
  export CXX=g++-14
  export CC=gcc-14
  CUDA=/opt/cuda make all
}

package() {
  cd $pkgname-$pkgver
  make prefix="$pkgdir"/usr install
  _kernver="$(</usr/src/linux/version)"
  install -Dt "$pkgdir/usr/lib/modules/$_kernver/extramodules" -m644 src/gdrdrv/gdrdrv.ko
  zstd --rm -19 "$pkgdir/usr/lib/modules/$_kernver/extramodules/gdrdrv.ko"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
