# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=motrix-next-bin
pkgver=3.8.8
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
source_x86_64=("$pkgname-$pkgver-x86_64.deb::$url/releases/download/v$pkgver/MotrixNext_${pkgver}_amd64.deb")
sha256sums_x86_64=('afca3722cb83aa6137d3ef40894f645a64a5743521b69a88ffb768474b824e50')
sha256sums_aarch64=('8ab858603a6f2c10d41067d7db6e60ac8c73e432f6049765e284db9157afb9dc')
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
}
