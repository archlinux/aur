# Maintainer: realdanvanth <realdanvanth@gmail.com>
pkgname=realvim
pkgver=1.0.0  # This will be updated automatically by pkgver()
pkgrel=1
pkgdesc="A lightweight terminal text editor written in rust"
arch=('x86_64')
url="https://github.com/realdanvanth/realvim"
license=('custom')
depends=('gcc-libs' 'oniguruma')
makedepends=('rust' 'cargo' 'pkgconf' 'git')
source=("git+https://github.com/realdanvanth/realvim.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/realvim"
    # Simple incremental version
    printf "1.0.%s" "$(git rev-list --count HEAD)"
}

prepare() {
    cd "$srcdir/realvim"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/realvim"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ONIG_SYS_STATIC=false
    export RUSTONIG_SYSTEM_LIBONIG=1
    cargo build --release --all-features
}

check() {
    cd "$srcdir/realvim"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "$srcdir/realvim"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/realvim"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
