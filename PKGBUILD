# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=liteparse-bin
pkgver=2.14.3
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
sha256sums_x86_64=('540d6dd64da65039fd6cfd03f0c5b65fc1c4387c9ec6377910fbeb0de32eb49b')
sha256sums_aarch64=('0ebc695d89990430e4208de973f13eab614d2dec766c2276d6c17e3a67b8fd35')

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
