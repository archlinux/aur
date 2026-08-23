# Maintainer: Pedrojok01 <pedrojok@pm.me>
# NOTE: the AUR repo ssh://aur@aur.archlinux.org/linux-broadcast-cuda.git must be
# created manually once (first push) before CI can update it, same as the main
# linux-broadcast-bin package.
pkgname=linux-broadcast-cuda
_pkgname=linux-broadcast
pkgver=0.4.0
pkgrel=1
# Debian revision baked into the upstream .deb filename by build-cuda-addon.sh.
_debrev=1
pkgdesc="NVIDIA CUDA GPU-acceleration add-on for LinuxBroadcast (ONNX Runtime CUDA provider libraries)"
arch=('x86_64')
url="https://github.com/Pedrojok01/linux-broadcast"
license=('GPL-3.0-or-later')
depends=('linux-broadcast')
optdepends=(
  'cuda: NVIDIA CUDA 13 runtime libraries (required for GPU acceleration)'
  'cudnn: cuDNN 9 for CUDA 13 (required for GPU acceleration)'
)
provides=("${_pkgname}-cuda=$pkgver")
source=("${_pkgname}-cuda-$pkgver.deb::$url/releases/download/v$pkgver/${_pkgname}-cuda_${pkgver}-${_debrev}_amd64.deb")
sha256sums=('2d38f60f9b9276b54c6633dd667983500ca2fc7970d6c47f7625c4a591f9f367')
options=('!strip')

package() {
  cd "$srcdir"
  bsdtar -xf "${_pkgname}-cuda-$pkgver.deb"
  # cargo-deb / dpkg-deb may compress data.tar with xz or zst; try both.
  if [ -f data.tar.zst ]; then
    bsdtar -xf data.tar.zst -C "$pkgdir"
  elif [ -f data.tar.xz ]; then
    bsdtar -xf data.tar.xz -C "$pkgdir"
  else
    bsdtar -xf data.tar.* -C "$pkgdir"
  fi
}
