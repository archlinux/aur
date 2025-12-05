# Maintainer: Storm Dragon <storm_dragon@stormux.org>
pkgname=waytray
pkgver=1.0.0
pkgrel=1
pkgdesc="Wayland system tray with daemon/client architecture"
arch=('aarch64' 'x86_64')
url="https://github.com/destructatron/waytray"
license=('MIT')
depends=('gtk4' 'gstreamer' 'dbus')
makedepends=('rust' 'cargo')
optdepends=('pipewire-pulse: for audio volume control module'
            'power-profiles-daemon: for power profile switching')
source=("$pkgname-$pkgver.tar.gz::https://github.com/destructatron/waytray/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('237dc5eed5003885b8cbb0404d720cf351c59ef9e076b10ec5f6c5c4a087b4df')

prepare() {
    cd "$pkgname-$pkgver"
    # Generate Cargo.lock since it's not in the source tarball
    cargo generate-lockfile
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    # Install binaries
    install -Dm755 target/release/waytray-daemon "$pkgdir/usr/bin/waytray-daemon"
    install -Dm755 target/release/waytray "$pkgdir/usr/bin/waytray"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
