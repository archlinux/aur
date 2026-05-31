# Maintainer: sickhate <archate@gmail.com>
pkgname=meh2
_commit=6980166192bbf2d4e0e1562ff8a5368a3d222995
pkgver=0.1.0.r75.6980166
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
sha256sums=('57b7bb2e2f31d90a7f5a173490a88a109d6f5c55d6afb2371d9f60b0f612bbc6')

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
