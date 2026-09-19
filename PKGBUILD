# Maintainer: Denis "RinWate" Egorov <rinwate@yandex.ru>
# AUR PKGBUILD: builds xca-rs from the tagged tarball of the standalone repo.
# Before the first upload: run `updpkgsums` (pacman-contrib) to fill in the
# checksum, build-test with `makepkg -si`, then refresh .SRCINFO.

pkgname=xca-rs
pkgver=0.2.1
pkgrel=3
pkgdesc="XCA (X Certificate and Key Management) rewritten in Rust with GTK4 and libadwaita"
arch=('x86_64')
url="https://github.com/RinWate/xca-rs"
license=('GPL-2.0-or-later')
depends=('gtk4' 'libadwaita' 'openssl' 'glib2' 'glibc')
makedepends=('rust' 'gcc' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('721793d25557212d57d83cec72b5f8046e8ccc287a2d29c04fe3686f6bcb7aef')
options=(!lto)

# GitHub tag tarballs extract into "<canonical-repo-name>-<version>/".
# The repo's canonical name on GitHub is "XCA-RS" (github.com/RinWate/xca-rs
# redirects there), so this must keep the repo name's exact case.
_srcrel="XCA-RS-$pkgver"

prepare() {
    cargo fetch --locked --manifest-path "$_srcrel/Cargo.toml"
}

build() {
    cd "$_srcrel"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --frozen --release
}

check() {
    cd "$_srcrel"
    cargo test --frozen --release
}

package() {
    cd "$_srcrel"
    install -Dm755 "$srcdir/target/release/xca-rs" -t "$pkgdir/usr/bin"
    install -Dm644 packaging/org.xca.rs.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 packaging/org.xca.rs.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
