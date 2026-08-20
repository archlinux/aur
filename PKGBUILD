# Maintainer: vMohammad <vmohammad@vmohammad.dev>
pkgname=framr
pkgver=0.16.0
pkgrel=1
pkgdesc="Wayland screenshot, annotation and screen recording tool with ShareX-compatible uploads"
arch=('x86_64')
url="https://github.com/vMohammad24/framr"
license=('AGPL3')
conflicts=("$pkgname-bin")
options=('!lto')
depends=('wayland' 'libxkbcommon' 'dbus' 'cairo' 'libxcursor' 'alsa-lib' 'ffmpeg' 'pipewire' 'libdrm' 'mesa')
makedepends=('cargo' 'pkgconf' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4f40f90ccb581c40da2dffaf17848be4395614d6f3ded6919010cc2c99e4ba91')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/framr" "$pkgdir/usr/bin/framr"
    install -Dm644 "assets/framr-handler.desktop" "$pkgdir/usr/share/applications/framr-handler.desktop"

    target/release/framr completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/framr"
    target/release/framr completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_framr"
    target/release/framr completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/framr.fish"

    target/release/framr man target/man
    install -Dm644 target/man/*.1 -t "$pkgdir/usr/share/man/man1"

    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
