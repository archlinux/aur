# Maintainer: Stefan Zipproth <s.zipproth@ditana.org>
# Upstream Author: LostRuins Concedo (koboldcpp)
# Model Author: Bartowski (Hugging Face) (gemma-2-2b-it-Q6_K.gguf)
# Service Author: Stefan Zipproth

pkgname=ditana-koboldcpp
pkgver=1.72
pkgrel=9
pkgdesc="A systemd service that runs KoboldCpp with the gemma language model locally, giving you AI chat privately on your PC."
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL-3.0-only')
install=ditana-koboldcpp.install
depends=(
    'cblas'
    'clblast'
    'openblas'
    'python'
    'systemd'
    'vulkan-icd-loader'
)
conflicts=(
    'koboldcpp'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/LostRuins/koboldcpp/archive/refs/tags/v$pkgver.tar.gz"
    'https://huggingface.co/bartowski/gemma-2-2b-it-GGUF/resolve/main/gemma-2-2b-it-Q6_K.gguf'
    'logical_sampler_gemma_instruct.json'
    'koboldcpp.service'
    'koboldcpp.desktop'
    'koboldcpp.svg'
)
sha256sums=(
    '1159980d2cda0a9dfde9024454034b7b163e483395b78f6a8d41b58883476bd5'
    'f82c5c2230a8b452221706461eb93203443373625d96a05912d4f96c845c2775'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

build() {
    cd "$srcdir/koboldcpp-$pkgver"
    make LLAMA_OPENBLAS=1 LLAMA_CLBLAST=1 LLAMA_CUBLAS=1 LLAMA_VULKAN=1
}

package() {
    cd "$srcdir/koboldcpp-$pkgver"

    install -Dm644 -t "$pkgdir/usr/share/koboldcpp" ./*.so ./*.embd
    install -Dm644 -t "$pkgdir/usr/share/koboldcpp/kcpp_adapters" kcpp_adapters/*
    install -Dm755 koboldcpp.py "$pkgdir/usr/share/koboldcpp/koboldcpp.py"

    install -Dm644 "$srcdir/gemma-2-2b-it-Q6_K.gguf" "$pkgdir/usr/share/koboldcpp/models/gemma-2-2b-it-Q6_K.gguf"
    install -Dm644 "$srcdir/logical_sampler_gemma_instruct.json" "$pkgdir/usr/share/koboldcpp/logical_sampler_gemma_instruct.json"
    install -Dm644 "$srcdir/koboldcpp.service" "$pkgdir/usr/lib/systemd/system/koboldcpp.service"
    install -Dm644 "$srcdir/koboldcpp.desktop" "$pkgdir/usr/share/applications/koboldcpp.desktop"
    install -Dm644 "$srcdir/koboldcpp.desktop" "$pkgdir/etc/skel/Desktop/koboldcpp.desktop"
    install -Dm644 "$srcdir/koboldcpp.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/koboldcpp.svg"
}
