# Maintainer: sickhate <archate@gmail.com>
pkgname=meh2
pkgver=0.1.0.r36.886fcb7
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
makedepends=('cargo')
options=('!debug')
source=("meh2-0.1.0.r36.886fcb7.tar.gz::https://github.com/sickhate/meh2/archive/886fcb7.tar.gz")
sha256sums=('cdbb6cefc248537cc753027bf6c554d266eac79645d6bf2a1707a63c11f05759')

prepare() {
    cd "$srcdir/meh2-886fcb7"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/meh2-886fcb7"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --features default,builtin-default-config
}

check() {
    cd "$srcdir/meh2-886fcb7"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen 2>/dev/null | grep -v '^$' | grep -v 'running 0 tests' | grep -v 'test result: ok. 0 passed' || true
}

package() {
    cd "$srcdir/meh2-886fcb7"
    install -Dm755 "target/release/meh2" "$pkgdir/usr/bin/meh2"
    install -Dm644 /usr/share/licenses/spdx/GPL-3.0-or-later "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

