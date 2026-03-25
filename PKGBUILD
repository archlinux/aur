# Maintainer: futpib-bot <futpib-bot@users.noreply.github.com>
pkgname=goal-git
pkgver=r23.c7fe54e
pkgrel=1
pkgdesc="Hierarchical goal tracker CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/futpib/goal"
license=('unknown')
makedepends=('rust' 'cargo')
provides=('goal')
conflicts=('goal')
source=("$pkgname::git+https://github.com/futpib/goal.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # -flto=auto in CFLAGS causes bundled sqlite3 to emit LTO bitcode
    # which rust-lld cannot link; strip it for this build
    export CFLAGS="${CFLAGS/-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
    cargo build --release --locked
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CFLAGS="${CFLAGS/-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
    cargo test --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/goal "$pkgdir/usr/bin/goal"
}
