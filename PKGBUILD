# Maintainer: acceleration3 <acceleration23@gmail.com>
pkgname=mi-home-toolkit
pkgver=1.4.0
pkgrel=8
pkgdesc="Effortlessly manage Mi Home smart devices, such as viewing device info and enabling LAN mode for bulbs."
arch=('x86_64')
url="https://github.com/ApplY3D/mi-home-toolkit"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk')
makedepends=('rust' 'pnpm' 'pkgconf' 'mold' 'webkit2gtk-4.1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    pnpm install --frozen-lockfile
}

build() {
    cd "$srcdir/$pkgname-$pkgver/src-tauri"

    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export NODE_ENV=production
    export RUSTFLAGS="-C link-arg=-fuse-ld=mold"

    # Ignore AppImage errors
    pnpm tauri build || echo "Ignoring AppImage build failure"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "src-tauri/icons/icon.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
