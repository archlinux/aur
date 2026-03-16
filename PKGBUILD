# Maintainer: Your Name <your@email.com>
pkgname=motrix-next-bin
pkgver=3.2.3
pkgrel=1
pkgdesc="A full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust"
arch=('x86_64')
url="https://github.com/AnInsomniacy/motrix-next"
license=('MIT')
depends=(
    aria2
    cairo
    gdk-pixbuf2
    gtk3
    hicolor-icon-theme
    libappindicator-gtk3
    libsoup3
    webkit2gtk-4.1
)
source=("MotrixNext_${pkgver}_amd64.deb::https://github.com/AnInsomniacy/motrix-next/releases/download/v${pkgver}/MotrixNext_${pkgver}_amd64.deb")
sha256sums=('74c7ccd8703ec8a947013edfa9e94cfd5db1cb1cca0d514fe04d60e2d612017a')

package() {
    # Extract deb payload
    local tmpdir="${srcdir}/deb-extract"
    mkdir -p "$tmpdir"
    ar x "${srcdir}/MotrixNext_${pkgver}_amd64.deb" --output="$tmpdir"

    local data_tar
    data_tar=$(find "$tmpdir" -name "data.tar*" | head -1)
    tar -xf "$data_tar" -C "$pkgdir"

    # Remove bundled aria2c — provided by the aria2 dependency
    rm -f "$pkgdir/usr/bin/aria2c"

    # Replace bundled aria2c sidecar with a symlink to the system package
    local target_triple
    target_triple=$(gcc -dumpmachine | sed 's/-pc-/-/')
    local install_dir
    install_dir=$(find "$pkgdir/usr/lib" -maxdepth 1 -type d \( -name "*motrix*" -o -name "*MotrixNext*" \) 2>/dev/null | head -1)
    if [[ -n "$install_dir" ]]; then
        find "$install_dir" -name "aria2c-*" -delete
        ln -sf /usr/bin/aria2c "$install_dir/aria2c-${target_triple}"
    fi

    # Fix empty Categories so KDE launcher displays the app
    sed -i 's/^Categories=$/Categories=Network;FileTransfer;/' \
        "$pkgdir/usr/share/applications/MotrixNext.desktop"
}
