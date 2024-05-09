# Maintainer:  kxxt <rsworktech at outlook dot com>
pkgname=tracexec
pkgver=0.1.0
pkgrel=1
pkgdesc="A small utility for tracing execve{,at} and pre-exec behavior"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/kxxt/tracexec"
license=('GPL-2.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'cargo-about' 'git')
conflicts=('tracexec-bin')
backup=()
options=()
source=("git+https://github.com/kxxt/tracexec.git#tag=v$pkgver")
b2sums=('8625c4ebaaf346585342bbab8c99917112b3f2de1caf884730efc552c3e3af77774b119b687e5ceef136ad0890bec2e1b4657c7c97c596438b17355826f08215')

case "$CARCH" in
    riscv64)
        _feature_flags="--no-default-features"
        ;;
    *)
        _feature_flags="--all-features"
        ;;
esac

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # --bins: needed for test
    cargo build --bins --frozen --release $_feature_flags
    cargo about generate -o THIRD_PARTY_LICENSES.HTML about.hbs
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    RUST_TEST_THREADS=1 cargo test --frozen --release $_feature_flags
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 THIRD_PARTY_LICENSES.HTML "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.HTML"
}
