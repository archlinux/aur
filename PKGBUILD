pkgname=emmylua-analyzer-rust-git
_pkgname=emmylua-analyzer-rust
pkgver=0.19.0.r30.g4459d275
pkgrel=1
pkgdesc="EmmyLua Analyzer (Rust Version) - Language Server, Static Analysis, and Doc Generator"
arch=('x86_64' 'aarch64')
url="https://github.com/EmmyLuaLs/emmylua-analyzer-rust"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo' 'cmake' 'clang')
provides=("$_pkgname" 'emmylua_ls' 'emmylua_check' 'emmylua_doc_cli')
conflicts=("$_pkgname" 'emmylua_ls-git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    export CC=clang
    export CXX=clang++

    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/emmylua_ls"      "$pkgdir/usr/bin/emmylua_ls"
    install -Dm755 "target/release/emmylua_check"   "$pkgdir/usr/bin/emmylua_check"
    install -Dm755 "target/release/emmylua_doc_cli" "$pkgdir/usr/bin/emmylua_doc_cli"

    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    elif [ -f LICENSE.md ]; then
        install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    fi
}
