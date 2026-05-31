# Maintainer: Mykhailo Kolesnyk <mike at openbunker dot org>
# SPDX-License-Identifier: 0BSD
pkgname=waybar-wireguard
pkgver=0.1.0
pkgrel=1
pkgdesc="Waybar module: WireGuard tunnel state and toggle"
arch=('x86_64' 'aarch64')
url="https://github.com/mikek/waybar_wireguard"
license=('MIT' 'Apache-2.0')
depends=(
    'glibc'
    'libgcc'      # link (libgcc_s)
    'waybar'      # runtime: the host that loads this module's .so
    'gtk3'        # link
    'glib2'       # link (via gtk3)
)
optdepends=('wireguard-tools: for the default wg-quick up/down click commands')
makedepends=('cargo' 'libcap')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a7a9c1bac361aeac3bfe1ce8fc16f96f13d98bd88e345533f1260b2bac72bc67')
install="$pkgname.install"

_srcdir="waybar_wireguard-$pkgver"

prepare() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_INCREMENTAL=0
    cargo build --frozen --release
}

check() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$_srcdir"

    # Helper binary (CAP_NET_ADMIN applied post-install via the .install hook,
    # since file capabilities don't survive pacman's tarball packaging).
    install -Dm755 target/release/waybar-wireguard \
        "$pkgdir/usr/bin/waybar-wireguard"

    # CFFI module that Waybar dlopens.
    install -Dm755 target/release/libwaybar_wireguard.so \
        "$pkgdir/usr/lib/libwaybar_wireguard.so"

    # Bundled shield icons + their Lucide license.
    install -Dm644 -t "$pkgdir/usr/share/$pkgname/assets/" assets/*

    # Crate's own dual license.
    install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
