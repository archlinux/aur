# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=liteparse-bin
pkgver=2.4.1
pkgrel=1
pkgdesc='Fast local document parser for PDF, DOCX, XLSX, PPTX, and images with built-in OCR'
arch=('x86_64' 'aarch64')
url='https://developers.llamaindex.ai/liteparse/'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
optdepends=(
    'tesseract-data-eng: English OCR language data'
    'libreoffice-fresh: DOCX, XLSX, and PPTX document conversion'
    'imagemagick: image format conversion'
    'ghostscript: PostScript and EPS document conversion'
)
provides=('liteparse')
conflicts=('liteparse')
options=('!debug')

_gh_repo='run-llama/liteparse'

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/${_gh_repo}/releases/download/crates-v${pkgver}/lit-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/${_gh_repo}/releases/download/crates-v${pkgver}/lit-linux-arm64.tar.gz")
sha256sums_x86_64=('67b83c25a155b4ed891231a4c02e245bd13e270bb7b0b661bd2d203e3810e338')
sha256sums_aarch64=('8579b2fd831163697deecffebfccc245ff69d570e2991c7ae5a9fa2f7d86ae8b')

latestver() {
    gh api --paginate "repos/${_gh_repo}/releases" --jq \
        '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
        sed -nE 's/^crates-v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
    case "${CARCH}" in
        x86_64)  _srcdir=lit-linux-x64 ;;
        aarch64) _srcdir=lit-linux-arm64 ;;
    esac

    install -Dm755 "${_srcdir}/lit" "${pkgdir}/usr/lib/liteparse/liteparse"
    install -Dm755 "${_srcdir}/libpdfium.so" "${pkgdir}/usr/lib/liteparse/libpdfium.so"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/liteparse" <<'WRAPPER'
#!/bin/sh
if [ -z "$TESSDATA_PREFIX" ] && [ -d /usr/share/tessdata ]; then
    export TESSDATA_PREFIX=/usr/share/tessdata
fi
exec /usr/lib/liteparse/liteparse "$@"
WRAPPER
}
