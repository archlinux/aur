# Maintainer: guitaripod <guitaripod@icloud.com>
pkgname=emojipick
pkgver=0.1.5
pkgrel=1
pkgdesc='A fast, frecency-ranked emoji picker for KDE Plasma Wayland with a native global shortcut'
arch=('x86_64')
url='https://github.com/guitaripod/emojipick'
license=('GPL-3.0-only')
depends=('gtk4' 'wl-clipboard' 'noto-fonts-emoji' 'ydotool')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/guitaripod/emojipick/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d24a6c4c6c27a3792422bdc3d80922fe9ab028d7d40a7f4d62387150baca270c')

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
    install -Dm644 "org.emojipick.Emojipick.desktop" "$pkgdir/usr/share/applications/org.emojipick.Emojipick.desktop"
    install -Dm644 "org.emojipick.Emojipick.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.emojipick.Emojipick.svg"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/emojipick/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/emojipick/README.md"
}
