# Maintainer: Dwi Mulia Mokoginta <malwareslayer@users.noreply.github.com>
pkgname=ggml-aie
pkgver=0.3.0
pkgrel=1
pkgdesc='Tensor library for machine learning (with AMD XDNA/AIE2 NPU backend)'
arch=('x86_64')
url='https://github.com/malwareslayer/ggml-aie'
license=('MIT')
depends=('ggml>=0.29.0' 'llama-cpp' 'xrt=1:2.21.75' 'xrt-plugin-amdxdna=1:2.21.75')
makedepends=('cmake' 'ninja' 'git')
source=(
  "$pkgname::git+https://github.com/malwareslayer/ggml-aie.git#tag=v$pkgver"
  'ggml-0.29.0.tar.gz::https://codeload.github.com/ggml-org/ggml/tar.gz/refs/tags/v0.29.0'
)
sha256sums=(
  'SKIP'
  'b08d30d6685c5c90908e38dc279439fcc662b3b3f5a38c7bb2b447a31642c0f6'
)

build() {
  cmake -S "$srcdir/$pkgname" -B "$srcdir/build" -G Ninja \
    -DGGML_SOURCE_DIR="$srcdir/ggml-0.29.0" \
    -DGGML_LIBRARY_DIR=/usr/lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build "$srcdir/build" --target ggml-aie -j"$(nproc)"
}

check() {
  local exports
  exports=$(nm -D --defined-only "$srcdir/build/libggml-aie.so" | awk '$2 == "T" || $2 == "W" {print $3}')
  [[ $exports == ggml_backend_init ]]
  ! ldd -r "$srcdir/build/libggml-aie.so" 2>&1 | grep -E 'undefined symbol:|not found' >/dev/null
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
  local project="$srcdir/$pkgname"
  install -Dm644 "$project/packaging/systemd/90-aie2.conf" \
    "$pkgdir/usr/lib/systemd/system/ollama.service.d/90-aie2.conf"
  install -dm755 "$pkgdir/usr/share/ggml-aie/kernel"
  cp -a "$project/kernel/"* "$pkgdir/usr/share/ggml-aie/kernel/"
  install -Dm644 "$project/LICENSE" \
    "$pkgdir/usr/share/licenses/ggml-aie/LICENSE"
}
