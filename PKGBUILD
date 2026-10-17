# Maintainer: Andrea Foppiani <a.foppiani@gmail.com>
pkgname=cosmic-applet-mic
pkgver=0.1.0
pkgrel=1
pkgdesc="COSMIC panel applet showing default microphone mute status"
arch=('x86_64')
url="https://github.com/fppn/cosmic-applet-mic"
license=('GPL-3.0-only')
depends=('libpulse' 'libxkbcommon' 'wayland')
makedepends=('cargo' 'clang' 'git' 'mold')
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fppn/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('230a8486a81054a57c27dc75d6b04c719d343228fac938f45e46615effdec0bf')

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
    install -Dm755 "target/release/cosmic-applet-mic" \
        "$pkgdir/usr/bin/cosmic-applet-mic"
    install -Dm644 "io.github.fppn.CosmicAppletMic.desktop" \
        "$pkgdir/usr/share/applications/io.github.fppn.CosmicAppletMic.desktop"
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
