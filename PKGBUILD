# Maintainer: k4ditano <k4ditano@h2r.es>
pkgname=notnative-app
pkgver=0.1.3
pkgrel=1
pkgdesc="Note-taking application with Vim-like keybindings"
arch=('x86_64')
url="https://github.com/k4ditano/notnative-app"
license=('MIT')
depends=('gtk4' 'webkitgtk-6.0' 'libadwaita' 'gtksourceview5' 'libpulse' 'sqlite' 'mpv' 'mujs')
makedepends=('cargo' 'rust' 'git' 'pkgconf')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "mujs-linking.patch"
)
sha256sums=('SKIP'
            'SKIP')

prepare() {
    local srcdir_real="$srcdir/$pkgname-$pkgver"
    if [[ ! -d $srcdir_real ]]; then
        srcdir_real="$srcdir/notnative-omarchy-$pkgver"
    fi

    cd "$srcdir_real"
    patch -Np1 -i "$srcdir/mujs-linking.patch"
}

build() {
    local srcdir_real="$srcdir/$pkgname-$pkgver"
    if [[ ! -d $srcdir_real ]]; then
        srcdir_real="$srcdir/notnative-omarchy-$pkgver"
    fi

    cd "$srcdir_real"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export LIBSQLITE3_SYS_BUNDLED=0
    export RUSQLITE_SYS_BUNDLED=0
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --no-default-features --features sqlite-system
}

check() {
    local srcdir_real="$srcdir/$pkgname-$pkgver"
    if [[ ! -d $srcdir_real ]]; then
        srcdir_real="$srcdir/notnative-omarchy-$pkgver"
    fi

    cd "$srcdir_real"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export LIBSQLITE3_SYS_BUNDLED=0
    export RUSQLITE_SYS_BUNDLED=0
    cargo test --release --locked --no-default-features --features sqlite-system
}

package() {
    local srcdir_real="$srcdir/$pkgname-$pkgver"
    if [[ ! -d $srcdir_real ]]; then
        srcdir_real="$srcdir/notnative-omarchy-$pkgver"
    fi

    cd "$srcdir_real"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "notnative.desktop" "$pkgdir/usr/share/applications/notnative.desktop"
    install -Dm644 "assets/style.css" "$pkgdir/usr/share/$pkgname/assets/style.css"
    install -Dm644 "assets/logo/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/notnative.svg"
    install -Dm644 "assets/logo/logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/notnative.png"
    install -Dm644 "assets/logo/logo.png" "$pkgdir/usr/share/pixmaps/notnative.png"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
