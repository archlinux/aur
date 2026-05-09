# Maintainer: Kosa Matyas <kosa03matyas@gmail.com>
pkgname=hyprkcs-git
pkgver=1.25.6
pkgrel=1
pkgdesc="A fast, minimal Hyprland keybind cheat sheet and editor written in Rust/GTK4"
arch=('x86_64')
url="https://github.com/kosa12/hyprKCS"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'libxkbcommon' 'glibc' 'gcc-libs')
makedepends=('cargo' 'git' 'pkgconf')
options=('!lto')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')
validpgpkeys=('D2059131FDE2EECC7C90A549F2CB939C8AA67892')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 "target/release/hyprkcs" "$pkgdir/usr/bin/hyprkcs"
    install -Dm644 "hyprkcs.desktop" "$pkgdir/usr/share/applications/hyprkcs.desktop"
    install -Dm644 "assets/hyprkcs.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/hyprkcs.svg"
}
