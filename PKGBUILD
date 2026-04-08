# Maintainer: meledo <meledo@duck.com>
pkgname=patchwire
pkgver=${VERSION}
pkgrel=1
pkgdesc="PipeWire audio output router with GTK4 UI"
arch=('x86_64')
url="https://github.com/mel-edo/patchwire"
license=('GPL-3.0-or-later')
depends=(
    'pipewire'
    'pipewire-audio'
    'wireplumber'
    'gtk4'
    'libadwaita'
)
makedepends=(
    'rust'
    'cargo'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("${SRC_SHA256}")

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --offline
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/patchwire      "$pkgdir/usr/bin/patchwire"
    install -Dm755 target/release/patchwire-gtk  "$pkgdir/usr/bin/patchwire-gtk"
    install -Dm644 data/patchwire.service        "$pkgdir/usr/lib/systemd/user/patchwire.service"
    install -Dm644 data/patchwire.desktop        "$pkgdir/usr/share/applications/patchwire.desktop"
    install -Dm644 LICENSE                       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}