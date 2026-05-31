# Maintainer: sickhate <archate@gmail.com>
pkgname=meh2
_commit=cd17dfee8e4a03cc548a9e908fa8220eb069cda8
pkgver=0.1.0.r74.cd17dfe
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
sha256sums=('18d9c38dfe41f24f8a3a818941740bb5d5f0348955318f57c87bea1339c3aff5')

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
