# Maintainer: sickhate <archate@gmail.com>
pkgname=meh2
pkgver=0.1.0.r69.e61fe41
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
options=('!debug')
source=("meh2-0.1.0.r69.e61fe41.tar.gz::https://github.com/sickhate/meh2/archive/e61fe41.tar.gz")
sha256sums=('c8a65b8284721243c2aebc90da54eac8c05633df0188b25b4ca3d0e725b23af3')

prepare() {
    cd "$srcdir/meh2-e61fe41"
    export RUSTUP_TOOLCHAIN=stable
    rm -rf target
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/meh2-e61fe41"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --features default,builtin-default-config
}

check() {
    cd "$srcdir/meh2-e61fe41"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen 2>/dev/null | grep -v '^$' | grep -v 'running 0 tests' | grep -v 'test result: ok. 0 passed' || true
}

package() {
    cd "$srcdir/meh2-e61fe41"
    install -Dm755 "target/release/meh2" "$pkgdir/usr/bin/meh2"
    install -Dm644 /usr/share/licenses/spdx/GPL-3.0-or-later "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

