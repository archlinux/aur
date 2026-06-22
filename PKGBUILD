# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=motrix-next-bin
pkgver=3.9.6
pkgrel=1
pkgdesc="A full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/AnInsomniacy/motrix-next"
license=('MIT')
depends=(
    aria2
    cairo
    gdk-pixbuf2
    gtk3
    hicolor-icon-theme
    libappindicator
    libsoup3
    webkit2gtk-4.1
)
source=("LICENSE-MIT")
sha256sums=('82e71190970399412c9e40fc3f4e2dc1cb070d56433ee7f25af7a4e67f401f0e')
sha256sums_x86_64=('2b0d3e3be747f4228e5b996f9def0a6ee90defe2a29c646152a02818b54ff0bc')
sha256sums_aarch64=('46d956073304c3211ba9eb9051b834dd416b732f28b9348658cbbca2e64e5f1a')
source_x86_64=("$pkgname-$pkgver-x86_64.deb::$url/releases/download/v$pkgver/MotrixNext_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::$url/releases/download/v$pkgver/MotrixNext_${pkgver}_arm64.deb")

package() {
    # Extract the contents of data.tar.gz into the pkgdir itself
    tar -xf data.tar.gz -C "$pkgdir"

    # Remove bundled aria2c — provided by the aria2 dependency
    rm -f "$pkgdir/usr/bin/aria2c"

    # Replace bundled aria2c sidecar with a symlink to the system package
    local target_triple=$(gcc -dumpmachine | sed 's/-pc-/-/')
    find "$pkgdir/usr/lib/MotrixNext/" -name "aria2c-*" -delete
    ln -sf /usr/bin/aria2c "$pkgdir/usr/lib/MotrixNext/aria2c-${target_triple}"

    # Fix empty Categories so KDE launcher displays the app
    sed -i '/^Categories=/c\Categories=Network;FileTransfer;' \
        "$pkgdir/usr/share/applications/MotrixNext.desktop"

    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
