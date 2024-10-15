# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>
# Contributer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo), YellowRoseCx
pkgname=koboldcpp-hipblas
_pkgver=1.76
pkgver=$_pkgver.yr1
_git_pkgver=$pkgver-ROCm
pkgrel=1
pkgdesc="An easy-to-use AI text-generation software for GGML and GGUF models (with HIPBLAS, for ROCM)"
arch=('x86_64')
url="https://github.com/YellowRoseCx/koboldcpp-rocm"
license=('AGPL-3.0-only')
depends=(
  'python'
  'cblas'
  'clblast'
  'vulkan-icd-loader'
  'hipblas'
)
optdepends=(
  'python-customtkinter: for GUI launcher'
  'python-psutil: increasing the process CPU priority'
)
provides=("koboldcpp=$_pkgver" "koboldcpp-rocm=$_pkgver")
conflicts=('koboldcpp')
source=(
  "$pkgname-${_git_pkgver}.tar.gz::https://github.com/YellowRoseCx/koboldcpp-rocm/archive/refs/tags/v${_git_pkgver}.tar.gz"
  'koboldcpp.desktop'
  'koboldcpp.png'
)
sha256sums=(
  '073bc920df2a2f16e33e9531780c5adc7744e112512f86871cb0a07268299412'
  'fcec7b843b908e1c03496fdc0605e6509f52526a855c43db16e287ef646503ef'
  'd244788c74a693a383bea7db6ab2bb2f762e6020de900be977b16e18dcd20f54'
)

build() {
  cd "$srcdir/koboldcpp-rocm-${_git_pkgver}"
  make LLAMA_VULKAN=1 LLAMA_CLBLAST=1 LLAMA_HIPBLAS=1 LLAMA_PORTABLE=1
}

package() {
  cd "$srcdir/koboldcpp-rocm-${_git_pkgver}"

  install -d "$pkgdir/usr/share/koboldcpp"

  install -Dm644 "koboldcpp_default.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_default.so"
  install -Dm644 "koboldcpp_hipblas.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_hipblas.so"

  install -Dm644 "koboldcpp_failsafe.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_failsafe.so"
  install -Dm644 "koboldcpp_noavx2.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_noavx2.so"

  install -Dm644 "koboldcpp_vulkan.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_vulkan.so"
  install -Dm644 "koboldcpp_vulkan_noavx2.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_vulkan_noavx2.so"

  install -Dm644 "koboldcpp_clblast.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_clblast.so"
  install -Dm644 "koboldcpp_clblast_noavx2.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_clblast_noavx2.so"

  install -Dm644 "klite.embd" "$pkgdir/usr/share/koboldcpp/klite.embd"
  install -Dm644 "kcpp_docs.embd" "$pkgdir/usr/share/koboldcpp/kcpp_docs.embd"
  install -Dm644 "rwkv_vocab.embd" "$pkgdir/usr/share/koboldcpp/rwkv_vocab.embd"
  install -Dm644 "rwkv_world_vocab.embd" "$pkgdir/usr/share/koboldcpp/rwkv_world_vocab.embd"
  install -Dm644 "kcpp_sdui.embd" "$pkgdir/usr/share/koboldcpp/kcpp_sdui.embd"
  install -Dm644 "taesd.embd" "$pkgdir/usr/share/koboldcpp/taesd.embd"
  install -Dm644 "taesd_xl.embd" "$pkgdir/usr/share/koboldcpp/taesd_xl.embd"

  install -d "$pkgdir/usr/share/koboldcpp/kcpp_adapters"
  install -m644 "kcpp_adapters"/* "$pkgdir/usr/share/koboldcpp/kcpp_adapters/"

  install -Dm644 "koboldcpp.py" "$pkgdir/usr/share/koboldcpp/koboldcpp.py"

  echo '#!/bin/sh' > koboldcpp
  echo 'python /usr/share/koboldcpp/koboldcpp.py "$@"' >> koboldcpp

  install -Dm755 koboldcpp "$pkgdir/usr/bin/koboldcpp"

  install -Dm644 "$srcdir/koboldcpp.desktop" "$pkgdir/usr/share/applications/koboldcpp.desktop"
  install -Dm644 "$srcdir/koboldcpp.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/koboldcpp.png"
}
