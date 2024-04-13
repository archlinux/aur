# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>
# Contributer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo)
pkgname=koboldcpp-cuda
pkgver=1.62.2
pkgrel=1
pkgdesc="An easy-to-use AI text-generation software for GGML and GGUF models (with CUDA)"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL-3.0-only')
depends=(
  'python'
  'openblas'
  'clblast'
  'vulkan-icd-loader'
  'cuda'
)
optdepends=(
  'customtkinter: for GUI launcher'
  'python-psutil: increasing the process CPU priority'
)
provides=("koboldcpp=$pkgver")
conflicts=('koboldcpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LostRuins/koboldcpp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac300262d43c9b1ec4fcbbec7614f37bfbb69e9ce302a73f4af06885d04efd98')

build() {
  cd "$srcdir/koboldcpp-$pkgver"
  make LLAMA_VULKAN=1 LLAMA_OPENBLAS=1 LLAMA_CLBLAST=1 LLAMA_CUBLAS=1
}

package() {
  cd "$srcdir/koboldcpp-$pkgver"

  install -d "$pkgdir/usr/share/koboldcpp"

  install -Dm644 "koboldcpp_default.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_default.so"
  install -Dm644 "koboldcpp_cublas.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_cublas.so"
  install -Dm644 "koboldcpp_vulkan.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_vulkan.so"
  install -Dm644 "koboldcpp_openblas.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_openblas.so"
  install -Dm644 "koboldcpp_clblast.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_clblast.so"
  install -Dm644 "klite.embd" "$pkgdir/usr/share/koboldcpp/klite.embd"
  install -Dm644 "kcpp_docs.embd" "$pkgdir/usr/share/koboldcpp/kcpp_docs.embd"
  install -Dm644 "rwkv_vocab.embd" "$pkgdir/usr/share/koboldcpp/rwkv_vocab.embd"
  install -Dm644 "rwkv_world_vocab.embd" "$pkgdir/usr/share/koboldcpp/rwkv_world_vocab.embd"
  install -Dm644 "koboldcpp.py" "$pkgdir/usr/share/koboldcpp/koboldcpp.py"

  echo '#!/bin/sh' > koboldcpp
  echo 'python /usr/share/koboldcpp/koboldcpp.py "$@"' >> koboldcpp

  install -Dm755 koboldcpp "$pkgdir/usr/bin/koboldcpp"
}
