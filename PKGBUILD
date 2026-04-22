# Maintainer: yobson <aur@yobson.xyz>
pkgname=gale-git
pkgdesc='A lightweight mod manager for Thunderstore'
pkgver=1.13.1.r0.gaf87be2
pkgrel=1
arch=('x86_64')
url='https://github.com/Kesomannen/gale'
license=('GPL-3.0-or-later')
makedepends=('git' 'cargo' 'cargo-tauri' 'pnpm' 'lld' 'clang')
depends=('webkit2gtk-4.1' 'cairo' 'desktop-file-utils' 'xdg-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libsoup3' 'openssl' 'pango' 'sqlite' 'hicolor-icon-theme')
source=('git+https://github.com/Kesomannen/gale.git' 'Gale.desktop')
b2sums=('SKIP'
    'f87bf62232195c4d063ff59c1b6cc7d4c83e129f67ab824a16181d449dbe73cd9a6ebff37e1874a74a5b3f29ae6be7a261592e3e71cec1f3558a447787f9a32e')
conflicts=('gale' 'gale-bin')
provides=('gale')
options=('!lto')

pkgver() {
    cd "$srcdir/gale"
    git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$srcdir/gale"
    pnpm install

    cd "src-tauri"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=lld"
    export CC=clang
    export CXX=clang++
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$srcdir/gale"
    cargo tauri build --no-bundle -- --frozen
}

package() {
    install -Dm644 "$srcdir/Gale.desktop" "$pkgdir/usr/share/applications/Gale.desktop"

    cd "$srcdir/gale"

    install -Dm755 "src-tauri/target/release/gale" "$pkgdir/usr/bin/gale"
    install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/gale.png"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/gale.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gale.png"
}
