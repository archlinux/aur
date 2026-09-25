# Maintainer: Alexeyev Vitaly <vitamindbnfkz@gmail.com>
pkgname=linux-legion
pkgver=0.1.0
pkgrel=1
pkgdesc="Control center for Lenovo Legion laptops: power modes, fans, Spectrum RGB lighting, battery (Vantage for Linux)"
arch=('x86_64')
url="https://github.com/VitaminDB/linux-legion"
license=('MIT')
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
optdepends=('libx11: X11 session' 'libxcursor: cursors in X11' 'nvidia-utils: NVIDIA GPU monitoring')
makedepends=('cargo' 'git')
options=('!lto' '!debug')
install=linux-legion.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a08a4683d4c93bf4874f2e2770058462dfaed80fbb755e8d5924a6dcc855afd6')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # syngui — git-зависимость; коммит закреплён в Cargo.lock
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/linux_legion "$pkgdir/usr/bin/linux-legion"
    install -Dm644 packaging/linux-legion.desktop "$pkgdir/usr/share/applications/linux-legion.desktop"
    install -Dm644 packaging/70-linux-legion.rules "$pkgdir/usr/lib/udev/rules.d/70-linux-legion.rules"
    install -Dm644 assets/icon/linux-legion.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/linux-legion.svg"
    for s in 16 32 48 64 128 256 512; do
        install -Dm644 "assets/icon/linux-legion-$s.png" \
            "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/linux-legion.png"
    done
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
