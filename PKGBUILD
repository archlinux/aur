# Maintainer: Park Kiyong <parkiyong@users.noreply.github.com>
pkgname=dupont
pkgver=1.2
pkgrel=1
pkgdesc="Set your desktop wallpaper from Bing and Spotlight"
arch=('x86_64' 'aarch64')
url="https://github.com/parkiyong/dupont"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'openssl' 'glib2' 'libsoup3' 'hicolor-icon-theme')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')
options=('!lto')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/dupont" "$pkgdir/usr/bin/dupont"
    install -Dm644 "data/io.github.parkiyong.dupont.desktop" \
        "$pkgdir/usr/share/applications/io.github.parkiyong.dupont.desktop"
    install -Dm644 "data/icons/scalable/io.github.parkiyong.dupont.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.parkiyong.dupont.svg"
    install -Dm644 "data/icons/symbolic/io.github.parkiyong.dupont-symbolic.svg" \
        "$pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.parkiyong.dupont-symbolic.svg"
}
