# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>
# Contributer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo), YellowRoseCx
pkgname=koboldcpp-hipblas
_pkgver=1.67
pkgver=$_pkgver.yr0
pkgrel=2
pkgdesc="An easy-to-use AI text-generation software for GGML and GGUF models (with HIPBLAS, for ROCM)"
arch=('x86_64')
url="https://github.com/YellowRoseCx/koboldcpp-rocm"
license=('AGPL-3.0-only')
depends=(
  'python'
  'cblas'
  'openblas'
  'clblast'
  'vulkan-icd-loader'
  'hipblas'
)
optdepends=(
  'customtkinter: for GUI launcher'
  'python-psutil: increasing the process CPU priority'
)
provides=("koboldcpp=$_pkgver" "koboldcpp-rocm=$_pkgver")
conflicts=('koboldcpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/YellowRoseCx/koboldcpp-rocm/archive/refs/tags/v$pkgver-ROCm.tar.gz")
sha256sums=('ad1490d792ad26d5d9f065166f726b91b058b41509282ee362ed84065b545668')

build() {
  cd "$srcdir/koboldcpp-rocm-$pkgver-ROCm"
  make LLAMA_VULKAN=1 LLAMA_OPENBLAS=1 LLAMA_CLBLAST=1 LLAMA_HIPBLAS=1 LLAMA_PORTABLE=1
}

package() {
  cd "$srcdir/koboldcpp-rocm-$pkgver-ROCm"

  install -d "$pkgdir/usr/share/koboldcpp"

  install -Dm644 "koboldcpp_default.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_default.so"
  install -Dm644 "koboldcpp_openblas.so" "$pkgdir/usr/share/koboldcpp/koboldcpp_openblas.so"
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

  install -Dm644 "koboldcpp.py" "$pkgdir/usr/share/koboldcpp/koboldcpp.py"

  echo '#!/bin/sh' > koboldcpp
  echo 'python /usr/share/koboldcpp/koboldcpp.py "$@"' >> koboldcpp

  install -Dm755 koboldcpp "$pkgdir/usr/bin/koboldcpp"
}
