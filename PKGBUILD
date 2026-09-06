# Maintainer: QymIsTech <basson30@gmail.com>

pkgname=qymfm
_pkgname=QymFM
pkgver=0.2.0
pkgrel=1
pkgdesc="Modern file manager for QymOS built with GTK4 and Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/QymIs-Tech/QymFM"
license=('AGPL-3.0-or-later')
depends=(
    'cairo'
    'glib2'
    'glibc'
    'gtk4'
    'hicolor-icon-theme'
    'libgcc'
    'poppler-glib'
)
makedepends=(
    'cargo'
    'gettext'
    'pkgconf'
)
optdepends=(
    'ffmpegthumbnailer: video thumbnails'
    'file-roller: preferred archive extractor'
    'gst-libav: extra video codecs for quick preview'
    'gst-plugins-good: video playback in quick preview'
    'gvfs: network filesystem support'
    'gvfs-smb: SMB/CIFS shares'
    'libarchive: tar.gz archives (bsdtar)'
    'nfs-utils: NFS support'
    'openssh: SFTP support'
    'p7zip: 7z archives'
    'samba: SMB/CIFS sharing'
    'trash-cli: trash functionality'
    'udisks2: unmounting removable drives'
    'util-linux: volume labels (blkid)'
    'zip: ZIP archives'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4c3033ff344e2959c8240b7876cba9783bde2e36402fc7e989b9edd4b7f7daed')

prepare() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release

    # Compile gettext catalogues for installation
    for _po in po/*.po; do
        [ -e "$_po" ] || continue
        msgfmt "$_po" -o "${_po%.po}.mo"
    done
}

package() {
    cd "$_pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/qymfm
    install -Dm0644 -t "$pkgdir/usr/share/applications/" qymfm.desktop
    install -Dm0644 resources/icons/qymfm.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/qymfm.svg"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md README.ru.md

    for _mo in po/*.mo; do
        [ -e "$_mo" ] || continue
        _lang=$(basename "$_mo" .mo)
        install -Dm0644 "$_mo" \
            "$pkgdir/usr/share/locale/$_lang/LC_MESSAGES/$pkgname.mo"
    done
}
