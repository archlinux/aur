# Maintainer: Dwi Mulia Mokoginta <malwareslayer@users.noreply.github.com>
pkgname=ollama-aie2
pkgver=0.2.2
pkgrel=1
pkgdesc='Native GGML AIE2 backend for AMD XDNA1 NPU via XRT in Ollama'
arch=('x86_64')
url='https://github.com/malwareslayer/ollama-aie2'
license=('MIT')
depends=('ollama=0.40.16' 'xrt=1:2.21.75' 'xrt-plugin-amdxdna=1:2.21.75' 'systemd')
makedepends=('cmake' 'ninja' 'git')
source=(
  "$pkgname::git+https://github.com/malwareslayer/ollama-aie2.git#tag=v$pkgver"
  'llama-b12177.tar.gz::https://codeload.github.com/ggml-org/llama.cpp/tar.gz/b12177'
)
sha256sums=(
  'SKIP'
  'f50a52f4ba45dd5b4b906db97cf230ce2e3b1117a0b9017411322ecba63eea13'
)

build() {
  cmake -S "$srcdir/$pkgname" -B "$srcdir/build" -G Ninja \
    -DGGML_SOURCE_DIR="$srcdir/llama.cpp-b12177/ggml" \
    -DOLLAMA_LIBRARY_DIR=/usr/lib/ollama \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build "$srcdir/build" --target ggml-aie2 -j"$(nproc)"
}

check() {
  local exports
  exports=$(nm -D --defined-only "$srcdir/build/libggml-aie2.so" | awk '$2 == "T" || $2 == "W" {print $3}')
  [[ $exports == ggml_backend_init ]]
  ! ldd -r "$srcdir/build/libggml-aie2.so" 2>&1 | grep -E 'undefined symbol:|not found' >/dev/null
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
  local project="$srcdir/$pkgname"
  install -Dm644 "$project/packaging/systemd/90-aie2.conf" \
    "$pkgdir/usr/lib/systemd/system/ollama.service.d/90-aie2.conf"
  install -dm755 "$pkgdir/usr/share/ollama-aie2/kernel"
  cp -a "$project/kernel/"* "$pkgdir/usr/share/ollama-aie2/kernel/"
  install -Dm644 "$project/LICENSE" \
    "$pkgdir/usr/share/licenses/ollama-aie2/LICENSE"
}
