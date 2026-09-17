# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=lrcget
pkgver=2.2.0
pkgrel=1
pkgdesc='Utility for mass-downloading LRC synced lyrics for your offline music library.'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/tranxuanthang/lrcget'
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'libappindicator'
    'librsvg'
    'gcc-libs'
)
makedepends=(
    'cargo'
    'nodejs'
    'npm'
    'cargo-tauri'
    'openssl'
    'pkgconf'
)
options=(
    !lto
    !debug
)
provides=('lrcget')
conflicts=('lrcget-git' 'lrcget-bin')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
    'lrcget'
)
sha256sums=(
    '543e0d44f48534c2aaa739ede0eb0c482b828ecaca3f47a136006c320c9a5302'
    '123d8dc688e5b447ed6a9547fc4ddd1baec283238d86277392356c7e9fdef343'
)

prepare() {
    cd "$pkgname-$pkgver"
    npm install --package-lock --allow-git=all
    cd src-tauri
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    npm run build
    cd src-tauri
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 src-tauri/target/release/lrcget "$pkgdir/usr/bin/lrcget-bin"
    install -Dm0755 ../lrcget "$pkgdir/usr/bin/lrcget"
    install -Dm644 packaging/linux/LRCGET.desktop "$pkgdir/usr/share/applications/LRCGET.desktop"
    sed -i 's|Exec=LRCGET|Exec=lrcget|g' "$pkgdir/usr/share/applications/LRCGET.desktop"
    install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/pixmaps/LRCGET.png"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
