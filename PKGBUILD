# Maintainer: indyfive11 <203553604+indyfive11@users.noreply.github.com>
pkgname=vm-curator-gtk
pkgver=0.2.1
pkgrel=1
pkgdesc="GTK4/libadwaita graphical frontend for the vm-curator QEMU/KVM manager"
arch=('x86_64')
url="https://github.com/indyfive11/vm-curator-gtk"
license=('MIT')
depends=(
    'gcc-libs'
    'glib2'
    'gtk4'
    'libadwaita'
    'gtk4-layer-shell'
)
makedepends=(
    'cargo'
    'git'
    'pkg-config'
)
optdepends=(
    'qemu-desktop: launch and run virtual machines'
    'qemu-base: minimal QEMU without GUI tools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/indyfive11/vm-curator-gtk/archive/v$pkgver.tar.gz")
sha256sums=('64a7192eeac1806327b0a50d62c39555eca1003a05f080a399a27c521086fecd')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/vm-curator-gtk" \
        "$pkgdir/usr/bin/vm-curator-gtk"
    install -Dm644 "assets/vm-curator-gtk.desktop" \
        "$pkgdir/usr/share/applications/vm-curator-gtk.desktop"
    install -Dm644 "assets/vm-curator-gtk.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/vm-curator-gtk.svg"
    install -Dm644 "README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
