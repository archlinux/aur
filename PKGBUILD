# Maintainer: Gabriel Kaszewski <gabriel@gabrielkaszewski.dev>
# AUR package for k-launcher
# Copy this file as PKGBUILD to your AUR repo

pkgname=k-launcher
pkgver=0.2.1
pkgrel=1
pkgdesc='Wayland command palette launcher with fuzzy search, frecency, and plugin support'
arch=('x86_64')
url='https://github.com/GKaszewski/k-launcher'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
optdepends=(
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
    'xdg-utils: open files and URLs'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1ed5396ce9232d61fe63322d1284e38cb72418b08add85be11ae07e2c7527ad7')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p k-launcher
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/k-launcher" "$pkgdir/usr/bin/k-launcher"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "man/k-launcher.1" "$pkgdir/usr/share/man/man1/k-launcher.1"
    gzip -9 "$pkgdir/usr/share/man/man1/k-launcher.1"
    install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
    install -Dm644 docs/plugin-development.md "$pkgdir/usr/share/doc/$pkgname/plugin-development.md"
}
