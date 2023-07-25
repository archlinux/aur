# Maintainer: kikawet h5xf5j645@mozmail.com
pkgname=los-git
binname=los
pkgnamelong=lights_out_solver
pkgver=1.2.0.r0.gdb1d7f7
pkgrel=1
pkgdesc="CLI program created in Rust to solve Lights Out Puzzle"
arch=('x86_64')
url='https://github.com/kikawet/lights_out_solver'
license=('MIT')
makedepends=('cargo')
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd "$pkgnamelong"

    initial_branch=$(git rev-parse --abbrev-ref HEAD)

    git checkout origin/main
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

    git checkout "$initial_branch"
}

prepare() {
    cd "$pkgnamelong"

    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgnamelong"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgnamelong"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgnamelong"

    install -Dm0755 "target/release/$binname" "$pkgdir/usr/bin/$binname"
    install -Dm644 "$binname.1" "$pkgdir/usr/share/man/man1/$binname.1"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$binname/README"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$binname/LICENSE"
}
