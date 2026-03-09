# Maintainer: GreyXor <greyxor@protonmail.com>
pkgname=fastflowlm-git
pkgver=0.9.34.r36.g6cabefe
pkgrel=1
pkgdesc="Run LLMs on AMD Ryzen AI NPUs in minutes. (git development version)"
arch=('x86_64')
url="https://github.com/FastFlowLM/FastFlowLM"
license=('MIT')
depends=('xrt-plugin-amdxdna' 'fftw' 'curl' 'ffmpeg')
makedepends=('cmake' 'git' 'ninja' 'xrt' 'boost' 'rust')

source=("${pkgname}::git+${url}.git"
    "git+https://github.com/mlc-ai/tokenizers-cpp.git#commit=34885cf"
    "git+https://github.com/google/sentencepiece.git#commit=11051e3"
    "git+https://github.com/msgpack/msgpack-c.git#commit=092bc69")
b2sums=('SKIP'
        '0a0dcda55b15bc7851779e735e5dd205cf7711bec02819f4c5aa8d4088135461a09af00e9a38058afe26608ed34a12d254b7497f5e7abc5b916fade2be4f14d3'
        '7b4077d327de3cd0d6214339ff052df3492926dc00440b8d1ed044a542af7866346794c62c45017a3463ba4d43bfcfe6b56c8da48b93be9b16d847052bf642c8'
        '7f13c65354be3268d41a86436bc4242ccc41573646a883f50ab466a9115ba448b93b7dd028a0e74d20e0dd8fea8b47cff261ec34f3bc9d5b003d239c7966d053')

prepare() {
    cd "$srcdir/$pkgname"
    git submodule init
    git config submodule.third_party/tokenizers-cpp.url "$srcdir/tokenizers-cpp"
    git -c protocol.file.allow=always submodule update

    rm -rf "$srcdir/$pkgname/third_party/tokenizers-cpp/sentencepiece"
    cp -r "$srcdir/sentencepiece" "$srcdir/$pkgname/third_party/tokenizers-cpp/"

    rm -rf "$srcdir/$pkgname/third_party/tokenizers-cpp/msgpack"
    cp -r "$srcdir/msgpack-c" "$srcdir/$pkgname/third_party/tokenizers-cpp/msgpack"
}

build() {
    cd "$srcdir/$pkgname/src"

    cmake --preset linux-default \
      -DCMAKE_EXE_LINKER_FLAGS="-lonig" \
      -DCMAKE_SHARED_LINKER_FLAGS="-lonig"

    cmake --build build
}

package() {
    cd "$srcdir/$pkgname/src"
    DESTDIR="$pkgdir" cmake --install build

    rm -rf "$pkgdir/opt/fastflowlm/include"
}
