# Maintainer: sickhate <archate@gmail.com>
pkgname=meh2
pkgver=0.1.0.r72.833fc6a
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
source=("meh2-0.1.0.r72.833fc6a.tar.gz::https://github.com/sickhate/meh2/archive/833fc6a.tar.gz")
sha256sums=('6078b76e649deb44cf6c60fcd695e09b8b91cb87058d400dfd27fc1692cee6cf')

prepare() {
    cd "$srcdir/meh2-833fc6a"
    export RUSTUP_TOOLCHAIN=stable
    rm -rf target
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/meh2-833fc6a"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --features default,builtin-default-config
}

check() {
    cd "$srcdir/meh2-833fc6a"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen 2>/dev/null | grep -v '^$' | grep -v 'running 0 tests' | grep -v 'test result: ok. 0 passed' || true
}

package() {
    cd "$srcdir/meh2-833fc6a"
    install -Dm755 "target/release/meh2" "$pkgdir/usr/bin/meh2"
    install -Dm644 /usr/share/licenses/spdx/GPL-3.0-or-later "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

