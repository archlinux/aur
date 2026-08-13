# Maintainer: richc <admin+aur@sys.corbet.ch>
#
# llama.cpp for the Intel Arc GPU via SYCL — official precompiled binary, NO compilation.
# Repackages the upstream GitHub release `llama-<ver>-bin-ubuntu-sycl-fp16-x64.tar.gz`.
# The fast Intel GPU path (~25 tok/s on Lunar Lake Arc 140V); the NPU is handled
# separately by openvino-genai-bin (llama.cpp's own OpenVINO backend is ~190x slower
# and intentionally NOT used here).
#
# oneAPI (MKL/DNN/SYCL runtime) is an optdepend, sourced at runtime by the
# `llama-sycl` launcher — so this survives oneAPI version bumps with no rebuild.

pkgname=llama.cpp-sycl-bin
pkgver=b10400
pkgrel=1
pkgdesc="llama.cpp on Intel Arc GPU via SYCL — official precompiled binary (no compilation)"
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=('glibc' 'gcc-libs' 'curl')
optdepends=('intel-oneapi-basekit: SYCL runtime (MKL/DNN) — required for the GPU backend')
makedepends=('patchelf')
provides=('llama.cpp-sycl')
noextract=("llama-${pkgver}-sycl-fp16.tar.gz")
source=(
  "llama-${pkgver}-sycl-fp16.tar.gz::https://github.com/ggml-org/llama.cpp/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-sycl-fp16-x64.tar.gz"
  'llama-sycl'
)
sha256sums=(
  '521838869eca79b23b63a5262553a0d7a08ffb682cc65bed558c8ec0c599dfe0'
  'SKIP'
)

prepare() {
  mkdir -p sycl
  bsdtar -xf "llama-${pkgver}-sycl-fp16.tar.gz" -C sycl
}

build() {
  local d="$srcdir/sycl/llama-${pkgver}"
  # Libraries find their siblings via $ORIGIN. The SYCL runtime (MKL/DNN/SYCL) is
  # provided at runtime by the launcher sourcing oneAPI — not baked in here.
  find "$d" -maxdepth 1 -name '*.so*' -type f -exec patchelf --set-rpath '$ORIGIN' {} +
  find "$d" -maxdepth 1 -type f -executable ! -name '*.so*' -exec patchelf --set-rpath '$ORIGIN' {} +
}

package() {
  local d="$srcdir/sycl/llama-${pkgver}"
  install -d "$pkgdir/usr/lib/llama-sycl"
  find "$d" -maxdepth 1 -name '*.so*'                       -exec cp -dP {} "$pkgdir/usr/lib/llama-sycl/" \;
  find "$d" -maxdepth 1 -type f -executable ! -name '*.so*' -exec install -m755 {} "$pkgdir/usr/lib/llama-sycl/" \;
  install -Dm755 "$srcdir/llama-sycl" "$pkgdir/usr/bin/llama-sycl"
  install -Dm644 "$d/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
