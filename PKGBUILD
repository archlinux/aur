# Maintainer: TheBill2001 <billtran1632001 at gmail dot com>
# Contributer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo)

pkgname=koboldcpp
pkgver=1.123
pkgrel=1
pkgdesc="An easy-to-use AI text-generation software for GGML and GGUF models"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL-3.0-only')
depends=(
    "python"
    "vulkan-icd-loader"
    "python-requests"
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
    'json_to_gbnf'
    'kcpp_agent'
    'koboldcpp'
    'koboldcpp.desktop'
    'koboldcpp.png'
)
sha256sums=(
    '8136ca1809359cfc3d166f049664cb71b9faa45d277db14db85742da95e0119c'
    '0a02338100375ef45f6cd83168d3c135020a4d650c0eda6a5c2fd5f66469c760'
    '53c787d94bead546198ff4b7cf21f191dc054046694faaf2c4a5692724679b8b'
    '9915ba0fbc0931fc61dc0bcaf55394948e43d1328b3c08a12b730416dcd28238'
    '2f2f45a745b30392d01472c1f5e68f82e5e7d7353a4615cf94b9f0cd4fd0505b'
    'd244788c74a693a383bea7db6ab2bb2f762e6020de900be977b16e18dcd20f54'
)

build() {
    cd "$srcdir/koboldcpp-$pkgver"

    make LLAMA_VULKAN=1 
}

package() {
    cd "$srcdir"

    for i in json_to_gbnf kcpp_agent koboldcpp; do
        install -Dm644 "$i" "$pkgdir/usr/bin/$i"
    done

    install -Dm644 koboldcpp.desktop "$pkgdir/usr/share/applications/koboldcpp.desktop"
    install -Dm644 koboldcpp.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/koboldcpp.png"

    cd "$srcdir/koboldcpp-$pkgver"

    for i in {*.so,embd_res/*,kcpp_adapters/*} {json_to_gbnf,kcpp_agent,koboldcpp}.py; do
        install -Dm644 "$i" "$pkgdir/usr/share/koboldcpp/$i"
    done

    for i in {LICENSE,MIT_LICENSE_GGML_SDCPP_LLAMACPP_ONLY}.md; do
        install -Dm644 "$i" "${pkgdir}/usr/share/licenses/${pkgname}/$i"
    done

    # Compile Python scripts
    for i in "$pkgdir/usr/share/koboldcpp"/*.py; do
        python -m compileall -q -o 0 -o 1 -d '/usr/share/koboldcpp' "$i"
    done
}

