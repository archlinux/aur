# Maintainer: Rippa The Hutt <iacoporippagmail@duck.com>
# Binary package: downloads the prebuilt Linux artifact from the GitHub
# release and installs it (no compilation). Bump pkgver to match a published
# release tag (e.g. v0.1.0).

pkgname=mcomix-rs
pkgver=0.3.1
pkgrel=1
pkgdesc="A user-friendly, customizable comic book image viewer (Rust/GTK4 port)"
arch=('x86_64')
url="https://github.com/rippa-the-hutt/mcomix-rs"
license=('GPL2')
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
sha256sums=('900b9990af29cd16eefd6ec419e910d7b179b7296c5b05131861bdab79a6cd88'
            '436011ad5b90f48c0a3017a2a6f32b22419c7a95b21a4e7aee3e66e05f074995')

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
        install -Dm644 "${linuxdir}/icons/${d}/apps/mcomix-rs.png" \
            "${pkgdir}/usr/share/icons/hicolor/${d}/apps/mcomix-rs.png" 2>/dev/null || true
        for mime in application-x-mcomix-cbz application-x-mcomix-cbr application-x-mcomix-cbt; do
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
