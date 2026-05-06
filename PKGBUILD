# Maintainer: jingyu <francismajere@gmail.com>

pkgname=middlesox-git
_pkgname=middlesox
pkgver=0.0.1.r10.g264a281
pkgrel=1
pkgdesc="Scriptable event-driven controller for window managers and compositors"
arch=('x86_64')
url="https://github.com/washanhanzi/middlesox"
license=('MIT')
depends=('gcc-libs' 'glibc' 'wayland')
makedepends=('rust' 'git' 'pkgconf')
provides=("$_pkgname=$pkgver" 'msx')
conflicts=("$_pkgname" 'msx')
source=("$_pkgname::git+$url.git"
        'LICENSE')
sha256sums=('SKIP'
            'b014105d4927d609815c8f2e274d7187f341cc60ab85f06e86e986882b53aaf4')

pkgver() {
    cd "$srcdir/$_pkgname"

    local version
    version="$(awk -F '"' '/^version = / { print $2; exit }' Cargo.toml)"
    printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p middlesox-cli
}

check() {
    cd "$srcdir/$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_TARGET_DIR=target
    cargo test --frozen --workspace
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 target/release/msx "$pkgdir/usr/bin/msx"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 doc/architecture.md "$pkgdir/usr/share/doc/$_pkgname/architecture.md"

    install -Dm644 example/config.toml "$pkgdir/usr/share/doc/$_pkgname/examples/config.toml"
    install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/examples/scripts" example/scripts/*.rhai
    install -Dm755 -t "$pkgdir/usr/share/doc/$_pkgname/examples/scripts" example/scripts/*.sh
}
