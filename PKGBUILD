# Maintainer: Alexeyev Vitaly <vitamindbnfkz@gmail.com>
pkgname=ardor-mouse
pkgver=0.2.0
pkgrel=1
pkgdesc="Configuration tool for the ARDOR GAMING Edge Air Ultra mouse: DPI, RGB lighting, buttons, polling rate"
arch=('x86_64')
url="https://github.com/VitaminDB/ardor-mouse"
license=('MIT')
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
optdepends=('libx11: X11 session' 'libxcursor: cursors in X11')
makedepends=('cargo' 'git')
options=('!lto' '!debug')
install=ardor-mouse.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c31bc2108ef610ef6315f9e56f20fa1ec4ceb4381f07565ffe4a03a5894e613')

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
    install -Dm755 target/release/ardor_mouse "$pkgdir/usr/bin/ardor-mouse"
    install -Dm644 packaging/ardor-mouse.desktop "$pkgdir/usr/share/applications/ardor-mouse.desktop"
    install -Dm644 packaging/70-ardor-mouse.rules "$pkgdir/usr/lib/udev/rules.d/70-ardor-mouse.rules"
    install -Dm644 assets/icon/ardor-mouse.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ardor-mouse.svg"
    for s in 16 32 48 64 128 256 512; do
        install -Dm644 "assets/icon/ardor-mouse-$s.png" \
            "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/ardor-mouse.png"
    done
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
