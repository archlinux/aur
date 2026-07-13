# Maintainer: guitaripod <guitaripod@icloud.com>
pkgname=emojipick
pkgver=0.1.0
pkgrel=1
pkgdesc='A fast, frecency-ranked emoji picker for KDE Plasma Wayland with a native global shortcut'
arch=('x86_64')
url='https://github.com/guitaripod/emojipick'
license=('GPL-3.0-only')
depends=('gtk4' 'wl-clipboard')
optdepends=('ydotool: auto-paste the picked emoji into the focused window'
            'noto-fonts-emoji: color emoji glyphs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/guitaripod/emojipick/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8608bf706689dc6efa85d850209d77f1f0758ce95c2adb32f8bd0a68d4166de0')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/emojipick" "$pkgdir/usr/bin/emojipick"
    install -Dm644 "emojipick.service" "$pkgdir/usr/lib/systemd/user/emojipick.service"
    install -Dm644 "config.example.toml" "$pkgdir/usr/share/emojipick/config.example.toml"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/emojipick/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/emojipick/README.md"
}
