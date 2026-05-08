# Maintainer: Jan Wąsak <jan@wasak.dev>
pkgname=swell
pkgver=0.2.7
pkgrel=1
pkgdesc='TUI audio client for podcasts, internet radio, and Tidal'
arch=('x86_64')
url='https://codeberg.org/wasak/swell'
options=(!lto)
license=('MIT')
depends=('alsa-lib' 'openssl' 'gcc-libs')
makedepends=('cargo' 'git')
optdepends=('jq: rofi integration' 'rofi: launcher integration')
source=("git+https://codeberg.org/wasak/swell.git#tag=v${pkgver}")
sha256sums=('SKIP')

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
    install -Dm755 "target/release/swell" "$pkgdir/usr/bin/swell"
    install -Dm755 "swell-rofi" "$pkgdir/usr/bin/swell-rofi"
    install -Dm644 "swell.desktop" "$pkgdir/usr/share/applications/swell.desktop"
    install -Dm644 "swell.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/swell.svg"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
