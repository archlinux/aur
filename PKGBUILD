# Maintainer: Rippa The Hutt <iacoporippagmail@duck.com>
# Binary package: downloads the prebuilt Linux artifact from the GitHub
# release and installs it (no compilation). Bump pkgver to match a published
# release tag (e.g. v0.1.0).

pkgname=mcomix-rs
pkgver=0.3.0
pkgrel=1
pkgdesc="A user-friendly, customizable comic book image viewer (Rust/GTK4 port)"
arch=('x86_64')
url="https://github.com/rippa-the-hutt/mcomix-rs"
license=('GPL2')
# mcomix-rs supersedes the Python mcomix3 package (same icons/desktop files).
conflicts=('mcomix3')
replaces=('mcomix3')
depends=(
    'gtk4'
    'gdk-pixbuf2'
    'glib2'
    'pango'
    'cairo'
    'xz'
    'bzip2'
)
optdepends=(
    'unrar: for CBR/RAR archive support'
    'p7zip: for 7Zip/LHA archive support'
    'mupdf-tools: for PDF support'
)
source=(
    # The prebuilt x86_64 Linux binary from the release.
    "mcomix-rs-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/rippa-the-hutt/mcomix-rs/releases/download/v${pkgver}/mcomix-rs-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
    # The source archive at the same tag, for the .desktop/MIME/icons.
    "mcomix-rs-src-${pkgver}.tar.gz::https://github.com/rippa-the-hutt/mcomix-rs/archive/refs/tags/v${pkgver}.tar.gz"
)
# Hashes are pinned for the current pkgver. When bumping pkgver to a new
# release, regenerate them with:  updkgsums
sha256sums=('7e626c6a5d0e89e6037f70fb22458df9c61692b619fab6d5bc39b0247bbecc4a'
            '91948412c9ccd046444b408d329b51bb1a1bfa4cd9d2bfc751ea9f9c7244dfbd')

package() {
    # Binary from the release artifact.
    install -Dm755 "${srcdir}/mcomix-rs" "${pkgdir}/usr/bin/mcomix-rs"

    # Data files from the source archive (locate it robustly; GitHub archive
    # dirs are named <repo>-<tag>).
    local linuxdir
    linuxdir="$(dirname "$(find "${srcdir}" -path '*/packaging/linux/mcomix-rs.desktop' | head -1)")"

    install -Dm644 "${linuxdir}/mcomix-rs.desktop" \
        "${pkgdir}/usr/share/applications/mcomix-rs.desktop"
    install -Dm644 "${linuxdir}/mcomix-rs.xml" \
        "${pkgdir}/usr/share/mime/packages/mcomix-rs.xml"

    for d in 16x16 22x22 24x24 32x32 48x48 256x256; do
        install -Dm644 "${linuxdir}/icons/${d}/apps/mcomix3.png" \
            "${pkgdir}/usr/share/icons/hicolor/${d}/apps/mcomix3.png" 2>/dev/null || true
        for mime in application-x-cbz application-x-cbr application-x-cbt; do
            install -Dm644 "${linuxdir}/icons/${d}/mimetypes/${mime}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${d}/mimetypes/${mime}.png" 2>/dev/null || true
        done
    done
}

post_install() {
    update-desktop-database -q 2>/dev/null || true
    update-mime-database /usr/share/mime 2>/dev/null || true
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor 2>/dev/null || true
}

post_upgrade() {
    post_install
}
