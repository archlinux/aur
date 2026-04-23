# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=lrcget
pkgver=2.0.0
pkgrel=1
pkgdesc='Utility for mass-downloading LRC synced lyrics for your offline music library.'
arch=('x86_64' 'aarch64')
url='https://github.com/tranxuanthang/lrcget'
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator' 'librsvg' 'gcc-libs')
makedepends=('cargo' 'nodejs' 'npm' 'cargo-tauri' 'openssl' 'pkgconf')
options=(!lto)
provides=('lrcget')
conflicts=('lrcget-git' 'lrcget-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
    'lrcget')
sha256sums=('6967a7f117fde0d84ffc0ccb8e270fed30079d4c7ec88dcded0ecd8221ae544e'
            'b051010628a791599d33437a23e352dac46db9aa09bf466fee106ef70d952f7f')

prepare() {
    cd "$pkgname-$pkgver"
    npm install --package-lock
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
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
