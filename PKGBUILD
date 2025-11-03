# Maintainer: k4ditano <k4ditano@h2r.es>
pkgname=notnative-app
pkgver=0.1.3
pkgrel=1
pkgdesc="Blazingly fast native note-taking app with vim-like keybindings, built for Omarchy OS"
arch=('x86_64')
url="https://github.com/k4ditano/notnative-app"
license=('MIT')
depends=('gtk4' 'webkitgtk-6.0' 'libadwaita' 'gtksourceview5' 'libpulse' 'sqlite' 'mpv')
makedepends=('cargo' 'rust' 'git' 'pkgconf')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('a03849f532f461be9e842d6d045691d1014f747ef5bf4aaf6186ac1f3c0c49ca')

build() {
    cd "notnative-omarchy-$pkgver"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export LIBSQLITE3_SYS_BUNDLED=0
    export RUSQLITE_SYS_BUNDLED=0
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --no-default-features --features sqlite-system
}

check() {
    cd "notnative-omarchy-$pkgver"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export LIBSQLITE3_SYS_BUNDLED=0
    export RUSQLITE_SYS_BUNDLED=0
    cargo test --release --locked --no-default-features --features sqlite-system
}

package() {
    cd "notnative-omarchy-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "notnative.desktop" "$pkgdir/usr/share/applications/notnative.desktop"
    install -Dm644 "assets/style.css" "$pkgdir/usr/share/$pkgname/assets/style.css"
    install -Dm644 "assets/logo/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/notnative.svg"
    install -Dm644 "assets/logo/logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/notnative.png"
    install -Dm644 "assets/logo/logo.png" "$pkgdir/usr/share/pixmaps/notnative.png"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
