# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>
pkgname=hazkey-zenzai-vulkan
pkgver=0.2.0
pkgrel=2
pkgdesc="Zenzai neural conversion module for Hazkey"
arch=('x86_64' 'aarch64')
url="https://github.com/7ka-Hiira/fcitx5-hazkey"
license=('MIT')
depends=('hazkey-server' 'vulkan-icd-loader')
makedepends=('cmake' 'vulkan-headers')
provides=('hazkey-zenzai')
_llamacppversion=20251109.0
source=("https://github.com/7ka-Hiira/llama.cpp/archive/refs/tags/v$_llamacppversion.tar.gz"
        "https://huggingface.co/Miwa-Keita/zenz-v3.1-small-gguf/resolve/main/ggml-model-Q5_K_M.gguf")
sha256sums=('a1ec9a605879fc2b7b0bf54669af98cd14b3913e528e69bf564478c92dc7632f'
            '4de930c06bef8c263aa1aa40684af206db4ce1b96375b3b8ed0ea508e0b14f6c')

build() {
    cd llama.cpp-$_llamacppversion

    cmake -B build \
        -DCMAKE_INSTALL_RPATH='$ORIGIN' \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
        -DCMAKE_SKIP_BUILD_RPATH=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DLLAMA_CURL=OFF \
        -DLLAMA_STANDALONE=OFF \
        -DLLAMA_BUILD_TESTS=OFF \
        -DLLAMA_BUILD_EXAMPLES=OFF \
        -DLLAMA_BUILD_SERVER=OFF \
        -DLLAMA_ALL_WARNINGS=OFF \
        -DLLAMA_FATAL_WARNINGS=OFF \
        -DLLAMA_LLGUIDANCE=OFF \
        -DGGML_RPC=OFF \
        -DGGML_SCHED_MAX_COPIES=2 \
        -DGGML_NATIVE=ON \
        -DGGML_LTO=ON \
        -DGGML_VULKAN=ON

    cmake --build build --config Release
}

package() {
    # llama libs
    cd llama.cpp-$_llamacppversion/build/bin
    install -Dm755 libggml.so $pkgdir/usr/lib/hazkey/llama/libggml.so
    install -Dm755 libggml-base.so $pkgdir/usr/lib/hazkey/llama/libggml-base.so
    install -Dm755 libggml-vulkan.so $pkgdir/usr/lib/hazkey/llama/libggml-vulkan.so
    install -Dm755 libggml-cpu.so $pkgdir/usr/lib/hazkey/llama/libggml-cpu.so
    install -Dm755 libllama.so $pkgdir/usr/lib/hazkey/llama/libllama.so

    # zenzai model
    install -Dm644 $srcdir/ggml-model-Q5_K_M.gguf $pkgdir/usr/share/hazkey/zenzai.gguf

    # license
    install -Dm644 ../../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
