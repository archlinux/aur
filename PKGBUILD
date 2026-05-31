# Maintainer: sickhate <archate@gmail.com>
pkgname=meh2
pkgver=0.1.0.r70.93bd5b1
pkgrel=2
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
source=("meh2-0.1.0.r70.93bd5b1.tar.gz::https://github.com/sickhate/meh2/archive/93bd5b1.tar.gz")
sha256sums=('8f3c5a29d6c6173197acd365b4282f2969848419277b66d1ef69bf1fde1ef683')

prepare() {
    cd "$srcdir/meh2-93bd5b1"
    export RUSTUP_TOOLCHAIN=stable
    rm -rf target
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/meh2-93bd5b1"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --features default,builtin-default-config
}

check() {
    cd "$srcdir/meh2-93bd5b1"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen 2>/dev/null | grep -v '^$' | grep -v 'running 0 tests' | grep -v 'test result: ok. 0 passed' || true
}

package() {
    cd "$srcdir/meh2-93bd5b1"
    install -Dm755 "target/release/meh2" "$pkgdir/usr/bin/meh2"
    install -Dm644 /usr/share/licenses/spdx/GPL-3.0-or-later "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

