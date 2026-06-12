# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>
# Contributer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo)

pkgname=koboldcpp
pkgver=1.115
pkgrel=1
pkgdesc="An easy-to-use AI text-generation software for GGML and GGUF models"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL-3.0-only')
depends=(
    "python"
    "vulkan-icd-loader"
)
optdepends=(
    'python-customtkinter: for GUI launcher'
    'python-darkdetect: for GUI launcher'
    'python-psutil: increasing the process CPU priority'
    'zenity: native file picker dialogs'
    'yad: native file picker dialogs'
    'python-jinja: jinja2 templates'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/LostRuins/koboldcpp/archive/refs/tags/v$pkgver.tar.gz"
    'koboldcpp.desktop'
    'koboldcpp.png'
)
sha256sums=(
    '8894fe11ef17c5716b36a543d2c2f00d133d39d72d1313a24707b51d64d6014e'
    '2f2f45a745b30392d01472c1f5e68f82e5e7d7353a4615cf94b9f0cd4fd0505b'
    'd244788c74a693a383bea7db6ab2bb2f762e6020de900be977b16e18dcd20f54'
)

build() {
    cd "$srcdir/koboldcpp-$pkgver"

    make LLAMA_VULKAN=1 
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

    install -d "$pkgdir/usr/bin"
    echo '#!/bin/sh' > "$pkgdir/usr/bin/koboldcpp"
    echo 'exec /usr/bin/python3 /usr/share/koboldcpp/koboldcpp.py "$@"' >> "$pkgdir/usr/bin/koboldcpp"
    chmod +x "$pkgdir/usr/bin/koboldcpp"

    install -Dm644 "$srcdir/koboldcpp.desktop" "$pkgdir/usr/share/applications/koboldcpp.desktop"
    install -Dm644 "$srcdir/koboldcpp.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/koboldcpp.png"

    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 MIT_LICENSE_GGML_SDCPP_LLAMACPP_ONLY.md "${pkgdir}/usr/share/licenses/${pkgname}/MIT_LICENSE_GGML_SDCPP_LLAMACPP_ONLY.md"
}
