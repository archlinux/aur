# Maintainer: MrQuantumOFF <me@mrquantumoff.dev>

# GitHub slug the release tarball is fetched from. The release pipeline rewrites
# this line to ${{ github.repository }} at publish time, so it is always correct
# for the repo that cut the release even if the value committed here drifts.
_ghrepo="mrquantumoff/audioclock"

pkgname=audioclock
pkgver=0.2.0
pkgrel=1
pkgdesc="Inspect and manage PipeWire and WirePlumber audio clock and format settings"
arch=('x86_64' 'aarch64')
url="https://github.com/${_ghrepo}"
license=('MIT')
depends=('pipewire' 'wireplumber')
makedepends=('rust' 'cargo' 'pipewire' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_ghrepo}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1a9bea9bcac0acb809f8d185840bdaccc013ed492d7b2994d84a7378c236f35d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked -p audioclock-gui
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --release --locked --workspace
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "target/release/audioclock-gui" \
        "$pkgdir/usr/bin/audioclock-gui"

    install -Dm644 "packaging/dev.mrquantumoff.audioclock.desktop" \
        "$pkgdir/usr/share/applications/dev.mrquantumoff.audioclock.desktop"
    install -Dm644 "packaging/dev.mrquantumoff.audioclock.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/dev.mrquantumoff.audioclock.metainfo.xml"
    install -Dm644 "packaging/dev.mrquantumoff.audioclock.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.mrquantumoff.audioclock.svg"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
