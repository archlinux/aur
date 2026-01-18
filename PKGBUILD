# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>
# Contributer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo)

pkgname=koboldcpp-cuda
pkgver=1.106.1
pkgrel=1
pkgdesc="An easy-to-use AI text-generation software for GGML and GGUF models (with CUDA)"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL-3.0-only')
depends=(
    "python"
    "cblas"
    "clblast"
    "vulkan-icd-loader"
    "cuda"
)
optdepends=(
    'python-customtkinter: for GUI launcher'
    'python-psutil: increasing the process CPU priority'
    'zenity: native file picker dialogs'
    'yad: native file picker dialogs'
    'python-jinja: jinja2 templates'
)
provides=(
    "koboldcpp=$pkgver"
)
conflicts=(
    "koboldcpp"
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/LostRuins/koboldcpp/archive/refs/tags/v$pkgver.tar.gz"
    'koboldcpp.desktop'
    'koboldcpp.png'
)
sha256sums=(
    '1baf42c6812e7c2d25832280e15b70f2aea064376ed7b1d69f56ee9196506175'
    'fcec7b843b908e1c03496fdc0605e6509f52526a855c43db16e287ef646503ef'
    'd244788c74a693a383bea7db6ab2bb2f762e6020de900be977b16e18dcd20f54'
)

build() {
    cd "$srcdir/koboldcpp-$pkgver"

    make LLAMA_VULKAN=1 LLAMA_CLBLAST=1 LLAMA_CUBLAS=1 LLAMA_ARCHES_CU13=1
}

package() {
    cd "$srcdir/koboldcpp-$pkgver"

    install -d "$pkgdir/usr/share/koboldcpp"

    install -Dm644 ./*.so "$pkgdir/usr/share/koboldcpp/"
    install -Dm644 ./json_to_gbnf.py "$pkgdir/usr/share/koboldcpp/"

    install -d "$pkgdir/usr/share/koboldcpp/embd_res"
    install -Dm644 ./embd_res/* "$pkgdir/usr/share/koboldcpp/embd_res"

    install -d "$pkgdir/usr/share/koboldcpp/kcpp_adapters"
    install -m644 "kcpp_adapters"/* "$pkgdir/usr/share/koboldcpp/kcpp_adapters/"

    install -Dm644 "koboldcpp.py" "$pkgdir/usr/share/koboldcpp/koboldcpp.py"

    echo '#!/bin/sh' > koboldcpp
    echo 'python /usr/share/koboldcpp/koboldcpp.py "$@"' >> koboldcpp

    install -Dm755 koboldcpp "$pkgdir/usr/bin/koboldcpp"

    install -Dm644 "$srcdir/koboldcpp.desktop" "$pkgdir/usr/share/applications/koboldcpp.desktop"
    install -Dm644 "$srcdir/koboldcpp.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/koboldcpp.png"

    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 MIT_LICENSE_GGML_SDCPP_LLAMACPP_ONLY.md "${pkgdir}/usr/share/licenses/${pkgname}/MIT_LICENSE_GGML_SDCPP_LLAMACPP_ONLY.md"
}
