# Maintainer: Stefan Zipproth <s.zipproth@ditana.org>
# Upstream Author: LostRuins Concedo (koboldcpp)
# Model Author: Bartowski (Hugging Face) (gemma-2-2b-it-Q6_K.gguf)
# Service Author: Stefan Zipproth

pkgname=ditana-koboldcpp
pkgver=1.103
pkgrel=1
pkgdesc="A systemd service that runs KoboldCpp with the gemma language model locally, giving you AI chat privately on your PC."
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL-3.0-only')
install=ditana-koboldcpp.install
depends=(
    'blas-openblas'
    'clblast'
    'ocl-icd'
    'intel-compute-runtime' # optional dependency of ocl-icd, providing opencl-driver'
    'python'
    'systemd'
    'vulkan-icd-loader'
    'curl' # to download the model file in ditana-koboldcpp.install
    'coreutils' # to verify the model file in ditana-koboldcpp.install
)
makedepends=(
    'blas-openblas'
    'clblast'
    'coreutils'
    'ocl-icd'
    'python'
    'vulkan-icd-loader'
    'gzip'
)
conflicts=(
    'koboldcpp'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/LostRuins/koboldcpp/archive/refs/tags/v$pkgver.tar.gz"
    'logical_sampler_gemma_instruct.json'
    'koboldcpp.service'
    'koboldcpp.desktop'
    'koboldcpp.svg'
    'ditana-koboldcpp.1'
    'LICENSE'
)
sha256sums=(
    '2c46e8cfd3a9855a711f0b792a7c4eb0469474a0289c6066b61ffd3d040d6436'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

build() {
    cd "$srcdir/koboldcpp-$pkgver"
    make -j$(nproc) LLAMA_OPENBLAS=1 LLAMA_CLBLAST=1 LLAMA_VULKAN=1 LLAMA_PORTABLE=1
}

package() {
    cd "$srcdir/koboldcpp-$pkgver"

    install -Dm644 -t                                            "$pkgdir/usr/share/koboldcpp" ./*.so embd_res/*.embd
    install -Dm644 -t                                            "$pkgdir/usr/share/koboldcpp/kcpp_adapters" kcpp_adapters/*
    install -Dm755 "koboldcpp.py"                                "$pkgdir/usr/share/koboldcpp/koboldcpp.py"
    install -Dm644 "$srcdir/logical_sampler_gemma_instruct.json" "$pkgdir/usr/share/koboldcpp/logical_sampler_gemma_instruct.json"
    install -dm755                                               "$pkgdir/usr/share/koboldcpp/models" # required in ditana-koboldcpp.install
    install -Dm644 "$srcdir/koboldcpp.service"                   "$pkgdir/usr/lib/systemd/system/koboldcpp.service"
    install -Dm755 "$srcdir/koboldcpp.desktop"                   "$pkgdir/usr/share/applications/koboldcpp.desktop"
    install -Dm644 "$srcdir/koboldcpp.svg"                       "$pkgdir/usr/share/icons/hicolor/scalable/apps/koboldcpp.svg"
    install -Dm644 "$srcdir/ditana-koboldcpp.1"                  "$pkgdir/usr/share/man/man1/ditana-koboldcpp.1"
    install -Dm644 "$srcdir/LICENSE"                             "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
