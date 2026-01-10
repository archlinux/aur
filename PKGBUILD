# Maintainer: mfw <espadonne@outlook.com>

pkgname=firp
pkgver=0.1.0
pkgrel=1
pkgdesc='A Modern Fortran Interpreter with REPL, debugger, and JIT compilation'
arch=('x86_64' 'aarch64')
url='https://github.com/FortranGoingOnForty/firp'
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortranGoingOnForty/firp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29bdc248a2105f340c921fc0190cb06acb4be839205715f116664a3aec5b84b4')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    # Install main binary
    install -Dm755 "target/release/firp" "$pkgdir/usr/bin/firp"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true

    # Install example programs
    if [ -d "examples" ]; then
        install -dm755 "$pkgdir/usr/share/$pkgname/examples"
        install -Dm644 examples/*.f90 "$pkgdir/usr/share/$pkgname/examples/" 2>/dev/null || true
    fi
}
