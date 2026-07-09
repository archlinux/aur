# Maintainer: Deon Spengler <deon@spengler.co.za>

_ggml_commit=0714117daca2471b00e09554c7eaa74a06b0b2c5
pkgname=crispasr
pkgver=0.8.9
pkgrel=1
pkgdesc="Text-to-speech engine with a bundled ggml backend that has many ASR and TTS backends"
arch=('x86_64')
url="https://github.com/CrispStrobe/CrispASR"
license=('MIT')
depends=('glibc' 'gcc-libs' 'cblas' 'blas' 'opus' 'opusfile' 'opencore-amr'
         'libfdk-aac' 'lame' 'sentencepiece' 'vulkan-icd-loader')
makedepends=('cmake' 'shaderc' 'glslang' 'vulkan-headers')
optdepends=('espeak-ng: phonemizer for the kokoro/piper TTS backends (loaded via dlopen)')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "ggml-$_ggml_commit.tar.gz::https://github.com/CrispStrobe/ggml/archive/$_ggml_commit.tar.gz")
sha256sums=('6ab1f29b69c7012f2e161dca60f2485d7fe96d49327df70da3037697c5593a95'
            'feaabd73498521808f016798d786407442aca21f143c463874b6d52db36b4b63')

prepare() {
  # ggml is a git submodule and ships empty in the release tarball.
  rmdir "CrispASR-$pkgver/ggml"
  mv "ggml-$_ggml_commit" "CrispASR-$pkgver/ggml"
}

build() {
  cmake -B build -S "CrispASR-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=OFF \
    -DGGML_NATIVE=OFF \
    -DGGML_CCACHE=OFF \
    -DGGML_VULKAN=ON \
    -DCRISPASR_BUILD_TESTS=OFF \
    -DCRISPASR_BUILD_EXAMPLES=ON \
    -DCRISPASR_BUILD_SERVER=OFF \
    -Wno-dev
  cmake --build build
}

check() {
  ./build/bin/crispasr --help >/dev/null
  ./build/bin/crispasr-server --help >/dev/null
}

package() {
    install -Dm755 build/bin/crispasr "$pkgdir/usr/bin/crispasr"
    install -Dm644 "CrispASR-$pkgver"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
