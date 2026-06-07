# Maintainer: sickhate <archate@gmail.com>
pkgname=meh2
_commit=6e6b6634a47c442703dc758d700d089d8611a525
pkgver=0.1.0.r81.6e6b663
pkgrel=1
pkgdesc="GTK4 Wayland widget system with Rhai scripting (default build: no systray)"
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
sha256sums=('be32e3ca0186f23d44ab1db0446f13acf17d694747b1a6e531142601405dff7b')

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
    # Default profile: rhai + dbus/inotify vars + animations — no systray or plugins.
    # Use `cargo build --release --locked --features full` for tray + plugins + shader.
    cargo build --release --locked
}

check() {
    cd "$srcdir/meh2-$_commit"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --locked
}

package() {
    cd "$srcdir/meh2-$_commit"
    install -Dm755 "target/release/meh2" "$pkgdir/usr/bin/meh2"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
