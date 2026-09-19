# Maintainer: Denis "RinWate" Egorov <rinwate@yandex.ru>
# AUR PKGBUILD: builds xca-rs from the tagged tarball of the standalone repo.
# Before the first upload: run `updpkgsums` (pacman-contrib) to fill in the
# checksum, build-test with `makepkg -si`, then refresh .SRCINFO.

pkgname=xca-rs
pkgver=0.2.2
pkgrel=3
pkgdesc="XCA (X Certificate and Key Management) rewritten in Rust with GTK4 and GOST support"
arch=('x86_64')
url="https://github.com/RinWate/xca-rs"
license=('GPL-2.0-or-later')
depends=('gtk4' 'libadwaita' 'openssl' 'openssl-gost-engine' 'glib2' 'glibc')
makedepends=('rust' 'gcc' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29e4935c4fc10f1251991f82e1b2a4053986f3c56ede529aa9cb1733de87a188')
options=(!lto)

# GitHub tag tarballs extract into "<canonical-repo-name>-<version>/".
# The repo's canonical name on GitHub is "XCA-RS" (github.com/RinWate/xca-rs
# redirects there), so this must keep the repo name's exact case.
_srcrel="XCA-RS-$pkgver"

# Hermetic build: a fresh CARGO_HOME makes cargo ignore the builder's
# ~/.cargo/config.toml — cross linkers set there (e.g.
# x86_64-linux-gnu-gcc) break build scripts, and rustflags like
# target-cpu=native would produce a non-portable package. Unset
# makepkg.conf CFLAGS for the same reason (they leak into the bundled
# SQLCipher C objects).
_hermetic_cargo() {
    export CARGO_HOME="$srcdir/cargo-home"
    unset CFLAGS CXXFLAGS LDFLAGS
}

prepare() {
    _hermetic_cargo
    cargo fetch --locked --manifest-path "$_srcrel/Cargo.toml"
}

build() {
    _hermetic_cargo
    cd "$_srcrel"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --frozen --release
}

check() {
    _hermetic_cargo
    cd "$_srcrel"
    cargo test --frozen --release
}

package() {
    cd "$_srcrel"
    install -Dm755 "$srcdir/target/release/xca-rs" -t "$pkgdir/usr/bin"
    install -Dm644 packaging/org.xca.rs.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 packaging/org.xca.rs.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
