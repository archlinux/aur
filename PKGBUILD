# Maintainer: czyt <czytcn@gmail.com>
pkgname=floral-notepaper-app
pkgver=1.2.0
pkgrel=1
pkgdesc="花笺 — A lightweight, elegant cross-platform desktop sticky note app with Markdown support (Tauri/Rust)"
arch=(x86_64)
url="https://github.com/Achilng/floral-notepaper"
license=(MIT)
depends=(gtk3 webkit2gtk-4.1 libayatana-appindicator)
provides=(floral-notepaper)
conflicts=(floral-notepaper)
options=(!strip !debug)

# Upstream deb control metadata may lag the release tag (1.2.0 deb still
# declares Version: 1.0.4); the binary embeds the real version string.
_deb="floral-notepaper_${pkgver}_amd64.deb"
source=("${_deb}::https://github.com/Achilng/floral-notepaper/releases/download/v${pkgver}/${_deb}"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/Achilng/floral-notepaper/v${pkgver}/LICENSE")
sha256sums=('aafe846a5761b18397094700a7993e518528902fd22af62eab67494397321810'
            'e4df1e97f2ee75fe597e567546bf3070f5b09c9cc4879666b53fe5254e00994e')
noextract=("${_deb}")

# The release ships SHA256SUMS.txt; the update workflow verifies the deb
# against it before staging, since checksums here stay SKIP on GitHub.

package() {
    # Dynamic member lookup: do not assume a fixed compression format
    bsdtar -xOf "${srcdir}/${_deb}" "data.tar.*" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # Upstream desktop file ships with empty Categories; add Utility like the
    # existing community package does
    sed -i "s/Categories=/Categories=Utility;/" \
        "${pkgdir}/usr/share/applications/floral-notepaper.desktop"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
