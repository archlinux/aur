# Maintainer: Anthony Templeton anthonyt@duck.com
pkgname=swaddle
pkgver=0.1.6
pkgrel=1
pkgdesc="Swayidle inhibitor when watching content or listening to audio"
arch=('x86_64')
url="https://github.com/ATTron/swaddle"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('rust: For building with system-wide Rust'
            'rustup: For building with custom Rust toolchains')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    if command -v rustup &> /dev/null; then
        rustup default stable
    fi
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    if command -v rustup &> /dev/null; then
        export RUSTUP_TOOLCHAIN=stable
    fi
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Post-install instructions
    echo "Swaddle has been installed. To integrate it with Sway / Hyprland, add the following line to your configuration:"
    echo "exec_always --no-startup-id /usr/local/bin/swaddle &"
    echo "Then reload your configuration or restart Sway/Hyprland."
}
