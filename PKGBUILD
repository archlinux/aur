# Maintainer: Rui Ventura <rventura.pt@outlook.com>
pkgname=chiaki
pkgver=2.2.0
pkgrel=3
pkgdesc='Free and Open Source PS4 Remote Play Client'
arch=(x86_64)
url=https://git.sr.ht/~thestr4ng3r/chiaki
_url=https://git.sr.ht/thestr4ng3r/chiaki
license=(custom)
provides=(chiaki)
depends=(ffmpeg gcc-libs qt5-multimedia qt5-svg opus 'openssl>=1.1' sdl2)
makedepends=(cmake protobuf python-protobuf)
optdepends=(
  'intel-media-driver: VA-API backend for Intel GPUs (>= Broadwell)'
  'libva-intel-driver: VA-API backend for Intel GPUs (<= Haswell)'
  'linux-firmware: VA-API support for Intel GPUs (>= Skylake)'
  'libva-mesa-driver: VA-API backend for AMD (>= Radeon HD R2000) and Nvidia (Nouveau, GeForce 8 -> GTX 750) GPUs'
  'libva-vdpau-driver: VDPAU-based backend for VA-API'
  'mesa-vdpau: VDPAU for AMD (>= Radeon R600) and Nvidia (Nouveau, GeForce 8 -> GTX 750) GPUs'
  'nvidia-utils: Proprietary VDPAU / Codec support for Nvidia GPUs'
)
source=(
  "$_url/refs/download/v$pkgver/chiaki-v$pkgver-src.tar.gz"
  'nanopb-protobuf.patch'
  'munit-stdatomic.patch'
)
sha256sums=('f406894f3c2d751961d58c1e27e81f1313a3fed3d1a33d3bf4d6092ce6575cf8'
            'e5275fbb5353c5700119c25f5e449946339ed9e4bfc5b70b508ce324426b7c20'
            '5b8b32b1ecc982b5092ead640a0f364eda7cd5c952c699a5a758e5ed83f20710')

build() {
  patch -p1 -d "$srcdir/$pkgname" < nanopb-protobuf.patch
  patch -p1 -d "$srcdir/$pkgname" < munit-stdatomic.patch
  cmake \
    -S "$srcdir/$pkgname" \
    -B build \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname/LICENSES/"*
}
