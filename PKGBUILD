# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>
# Contributer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo)
pkgname=koboldcpp
pkgver=1.61.2
pkgrel=4
pkgdesc="An easy-to-use AI text-generation software for GGML and GGUF models"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL-3.0-only')
depends=(
  'python'
  'openblas'
  'clblast'
  'vulkan-icd-loader'
)
optdepends=(
  'customtkinter: for GUI launcher'
  'python-psutil: increasing the process CPU priority'
)
provides=('koboldcpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LostRuins/koboldcpp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eea87a2a780b4c99f87e06071a19c4c2508fe873cacb9da0d7cc6561f8e6e88d')

build() {
  cd "$srcdir/koboldcpp-$pkgver"
  make LLAMA_VULKAN=1 LLAMA_OPENBLAS=1 LLAMA_CLBLAST=1
}

package() {
  cd "$srcdir/koboldcpp-$pkgver"

  install -d "$pkgdir/usr/share/koboldcpp"

  install -Dm644 "koboldcpp_default.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_default.so"
  install -Dm644 "koboldcpp_vulkan.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_vulkan.so"
  install -Dm644 "koboldcpp_openblas.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_openblas.so"
  install -Dm644 "koboldcpp_clblast.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_clblast.so"
  install -Dm644 "klite.embd" "$pkgdir/usr/share/koboldcpp/klite.embd"
  install -Dm644 "kcpp_docs.embd" "$pkgdir/usr/share/koboldcpp/kcpp_docs.embd"
  install -Dm644 "rwkv_vocab.embd" "$pkgdir/usr/share/koboldcpp/rwkv_vocab.embd"
  install -Dm644 "rwkv_world_vocab.embd" "$pkgdir/usr/share/koboldcpp/rwkv_world_vocab.embd"
  install -Dm644 "koboldcpp.py" "$pkgdir/usr/share/koboldcpp/koboldcpp.py"

  echo '#!/bin/sh' > koboldcpp
  echo 'cd /usr/share/koboldcpp && python koboldcpp.py "$@"' >> koboldcpp

  install -Dm755 koboldcpp "$pkgdir/usr/bin/koboldcpp"
}
