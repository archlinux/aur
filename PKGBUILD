# Maintainer: eltonff <eltonfabricio10@gmail.com>

pkgname=bigtube
_pkgname=python-bigtube
pkgver=2.0.21
pkgrel=1
pkgdesc="Universal Multimedia Downloader"
arch=('any')
url="https://github.com/eltonfabricio10/python-bigtube"
license=('MIT')

depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'yt-dlp'
    'python-requests'
    'python-mpv'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-plugins-ugly'
    'gst-libav'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
    'gettext'
)

optdepends=('ffmpeg: Convert Files')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eltonfabricio10/python-bigtube/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${_pkgname}-${pkgver}"

    sed -i "s/^version = .*/version = \"${pkgver}\"/" pyproject.toml

    for po_file in po/*.po; do
        if [[ -f "$po_file" ]]; then
            _lang=$(basename "$po_file" .po)
            msgfmt "$po_file" -o "po/${_lang}.mo"
        fi
    done

    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "src/bigtube/data/bigtube.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/bigtube.png"
    install -Dm644 "src/bigtube/data/org.big.bigtube.desktop" "${pkgdir}/usr/share/applications/org.big.bigtube.desktop"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    for mo_file in po/*.mo; do
        if [[ -f "$mo_file" ]]; then
            _lang=$(basename "$mo_file" .mo)
            install -Dm644 "$mo_file" "${pkgdir}/usr/share/locale/${_lang}/LC_MESSAGES/bigtube.mo"
        fi
    done
}
