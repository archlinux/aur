# Maintainer: nasedkinpv <nasedkinpv@users.noreply.github.com>
pkgname=numr-git
pkgver=0.6.0
pkgrel=1
pkgdesc="A text calculator for natural language expressions with a vim-style TUI (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/nasedkinpv/numr"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('numr' 'numr-cli')
conflicts=('numr' 'numr-bin')
source=("git+https://github.com/nasedkinpv/numr.git")
sha256sums=('SKIP')

pkgver() {
    cd numr
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd numr
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd numr
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd numr
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

package() {
    cd numr
    install -Dm755 "target/release/numr" "$pkgdir/usr/bin/numr"
    install -Dm755 "target/release/numr-cli" "$pkgdir/usr/bin/numr-cli"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
