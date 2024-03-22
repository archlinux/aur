# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>
# Contributer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo), YellowRoseCx
pkgname=koboldcpp-hipblas
pkgver=1.61.2.yr1
pkgrel=1
pkgdesc="KoboldCpp is an easy-to-use AI text-generation software for GGML and GGUF models (with HIPBLAS, for ROCM)"
arch=('x86_64')
url="https://github.com/YellowRoseCx/koboldcpp-rocm"
license=('AGPL3')
depends=(
  'python'
  'openblas'
  'clblast'
  'vulkan-icd-loader'
  'hipblas'
)
optdepends=(
  'customtkinter: for GUI launcher'
)
provides=('koboldcpp' 'koboldcpp-hipblas' 'koboldcpp-rocm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/YellowRoseCx/koboldcpp-rocm/archive/refs/tags/v$pkgver-ROCm.tar.gz")
sha256sums=('3e1adc6ad2d4282f7fc4066ba81bf9470276283094e5e9ab3f47a8438853ce52')

build() {
  cd "$srcdir/koboldcpp-rocm-$pkgver-ROCm"
  make LLAMA_VULKAN=1 LLAMA_OPENBLAS=1 LLAMA_CLBLAST=1 LLAMA_HIPBLAS=1
}

package() {
  cd "$srcdir/koboldcpp-rocm-$pkgver-ROCm"

  install -d "$pkgdir/usr/share/koboldcpp"

  install -Dm644 "koboldcpp_default.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_default.so"
  install -Dm644 "koboldcpp_hipblas.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_hipblas.so"
  install -Dm644 "koboldcpp_vulkan.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_vulkan.so"
  install -Dm644 "koboldcpp_openblas.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_openblas.so"
  install -Dm644 "koboldcpp_clblast.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_clblast.so"
#   install -Dm644 "koboldcpp_failsafe.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_failsafe.so"
#   install -Dm644 "koboldcpp_noavx2.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_noavx2.so"
#   install -Dm644 "koboldcpp_clblast_noavx2.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_clblast_noavx2.so"
#   install -Dm644 "koboldcpp_vulkan_noavx2.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_vulkan_noavx2.so"
  install -Dm644 "klite.embd" "$pkgdir/usr/share/koboldcpp/klite.embd"
  install -Dm644 "kcpp_docs.embd" "$pkgdir/usr/share/koboldcpp/kcpp_docs.embd"
  install -Dm644 "rwkv_vocab.embd" "$pkgdir/usr/share/koboldcpp/rwkv_vocab.embd"
  install -Dm644 "rwkv_world_vocab.embd" "$pkgdir/usr/share/koboldcpp/rwkv_world_vocab.embd"
  install -Dm644 "koboldcpp.py" "$pkgdir/usr/share/koboldcpp/koboldcpp.py"

  echo '#!/bin/sh' > koboldcpp
  echo 'cd /usr/share/koboldcpp && python koboldcpp.py "$@"' >> koboldcpp

  install -Dm755 koboldcpp "$pkgdir/usr/bin/koboldcpp"
}
