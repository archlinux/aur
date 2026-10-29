# Maintainer: cagedbird043 <cagedbird043@gmail.com>

pkgname=nvrm-vaapi-driver
pkgver=0.2.4
pkgrel=1
pkgdesc='VA-API driver for NVIDIA GPUs (NVDEC/NVENC via open kernel module ioctls, no CUDA)'
arch=('x86_64')
url='https://github.com/cagedbird043/nvidia-vaapi-driver'
license=('MIT')
depends=('gcc-libs' 'glibc' 'NVIDIA-MODULE')
makedepends=('cargo' 'clang' 'libva')
provides=('libva-nvidia-driver')
conflicts=('libva-nvidia-driver' 'libva-nvidia-driver-cagedbird<0.1.0')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c5c63bb0dcec90a32d581e2ca9d865fa156a38d6f7036bce67f0f3b79b0028c1')

prepare() {
  cd "nvidia-vaapi-driver-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "nvidia-vaapi-driver-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "nvidia-vaapi-driver-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "nvidia-vaapi-driver-$pkgver"
  install -Dm755 target/release/librustnv_drv_video.so \
    "$pkgdir/usr/lib/dri/nvidia_drv_video.so"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
