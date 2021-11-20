# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Trevor Bentley <trevor@trevorbentley.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=circadian
pkgver=0.6.0
pkgrel=1
pkgdesc="Linux auto-suspend/wake power management daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/mrmekon/$pkgname"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('xssstate: for monitoring x11 input'
            'xprintidle: for monitoring x11 input'
            'procps-ng: for monitoring tty input, uptime or processes'
            'net-tools: for monitoring ssh or smb'
            )
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('4c17d36f99dd39eace33d08b236df9ed1c4d19a5599b9b561fb000067ea829164053e056188b3f9f188ebaa9727ad784907e04f9226c137a1424e041d68364c9')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # The cargo.lock file is not consistent and needs to be updated.
    cargo generate-lockfile
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -T "resources/circadian.conf.in" "$pkgdir/etc/circadian.conf" 
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "resources/circadian.service"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "README.md"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}