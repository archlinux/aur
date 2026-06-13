# Maintainer: sickhate <archate@gmail.com>
pkgname=meh2
_commit=e41e5cdb3f3cc1b7a884b8401d254fdd64ceb862
pkgver=0.1.0.r88.e41e5cd
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
sha256sums=('b877767d4caf6ec63f4b30fdc67ab2e59060a262dab9887ddc1e58b3fe5cffa8')

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
