# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=liteparse-bin
pkgver=2.0.3
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
_pdfium_ver=7847

source_x86_64=(
    "${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/${_gh_repo}/releases/download/crates-v${pkgver}/lit-linux-x64.tar.gz"
    "pdfium-${_pdfium_ver}-x86_64.tgz::https://github.com/run-llama/pdfium-binaries/releases/download/chromium%2F${_pdfium_ver}/pdfium-linux-x64.tgz"
)
source_aarch64=(
    "${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/${_gh_repo}/releases/download/crates-v${pkgver}/lit-linux-arm64.tar.gz"
    "pdfium-${_pdfium_ver}-aarch64.tgz::https://github.com/run-llama/pdfium-binaries/releases/download/chromium%2F${_pdfium_ver}/pdfium-linux-arm64.tgz"
)
sha256sums_x86_64=('2fa631401fb55d16c2ac875b4b532347b8f7f13e1818938f72b3cd448708f47f'
                   '3e8326bc517d071c569efc23f6e18d60a83c7b775c714bb571c609fffebd5320')
sha256sums_aarch64=('a1c13f77721d9e4cf7058330538a568756a3c1486139f75c2d58f4d52d88676d'
                    '9fc1c556fb5b9764f9f6f474161d871776c25a507cb82ba25006beb658c29cea')

latestver() {
    gh api --paginate "repos/${_gh_repo}/releases" --jq \
        '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
        sed -nE 's/^crates-v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
    case "${CARCH}" in
        x86_64)  install -Dm755 lit-linux-x64 "${pkgdir}/usr/lib/liteparse/liteparse" ;;
        aarch64) install -Dm755 lit-linux-arm64 "${pkgdir}/usr/lib/liteparse/liteparse" ;;
    esac

    install -Dm755 lib/libpdfium.so "${pkgdir}/usr/lib/liteparse/libpdfium.so"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/liteparse" <<'WRAPPER'
#!/bin/sh
if [ -z "$TESSDATA_PREFIX" ] && [ -d /usr/share/tessdata ]; then
    export TESSDATA_PREFIX=/usr/share/tessdata
fi
exec /usr/lib/liteparse/liteparse "$@"
WRAPPER
}
