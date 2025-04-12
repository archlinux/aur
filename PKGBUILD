pkgname=todotree-git
pkgver=r19.5dd7a08
pkgrel=1
pkgdesc="Display todos with a dependency tree"
url="https://github.com/daimh/todotree.git"
license=("MIT")
makedepends=("cargo")
depends=()
arch=("x86_64")
source=("git+https://github.com/daimh/todotree.git")
b2sums=('SKIP')

pkgver() {
        cd ./todotree
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd todotree
    cargo fetch --locked --target "$(rustc -vV | sed -n "s/host: //p")"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd todotree
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd todotree
    cargo test --frozen --all-features
}

package() {
    cd todotree
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/todotree"
}
