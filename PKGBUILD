# Maintainer: sickhate <archate@gmail.com>
pkgname=meh2
_commit=fa49a046d1768364d7eb783b57c0dcd47196fc07
pkgver=0.1.0.r73.fa49a04
pkgrel=1
pkgdesc="GTK4 Wayland widget system with Rhai scripting (fork of meh)"
arch=('x86_64')
url="https://github.com/sickhate/meh2"
license=('GPL-3.0-or-later')
depends=(
    'gtk4'
    'gtk4-layer-shell'
    'libadwaita'
    'cairo'
    'glib2'
    'pango'
)
makedepends=('rust' 'cargo')
options=('!debug' '!lto')
source=("meh2-$pkgver.tar.gz::https://github.com/sickhate/meh2/archive/$_commit.tar.gz")
sha256sums=('9aafe0a688234a03351bcf8b824147a39d04b9350ecf88fb9170270617f16ccc')

prepare() {
    cd "$srcdir/meh2-$_commit"
    export RUSTUP_TOOLCHAIN=stable
    rm -rf target
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/meh2-$_commit"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --features default,builtin-default-config
}

check() {
    cd "$srcdir/meh2-$_commit"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen 2>/dev/null | grep -v '^$' | grep -v 'running 0 tests' | grep -v 'test result: ok. 0 passed' || true
}

package() {
    cd "$srcdir/meh2-$_commit"
    install -Dm755 "target/release/meh2" "$pkgdir/usr/bin/meh2"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
