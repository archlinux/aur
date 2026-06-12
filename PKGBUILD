# Maintainer: Zmole Cristian <tragdate@gmail.com>
pkgname=rustgraph
pkgver=0.8.1
pkgrel=1
pkgdesc="Rust code navigation built for AiDX — AST-aware, MCP-native, token-efficient."
arch=('x86_64')
url="https://github.com/ZmoleCristian/rustgraph"
license=('0BSD')
depends=('gcc-libs')
makedepends=('cargo')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ZmoleCristian/rustgraph/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('62d1ffcde95f6c8131f871996ca448092f7704b8a651097d72fcc2bdcad8b756')

# Hermetic cargo: the build runs RUSTUP_TOOLCHAIN=stable, so nightly-only
# rustflags/profiles in the user's cargo configs would break it. Isolate
# CARGO_HOME, pin RUSTFLAGS, pass --target-dir on the CLI (beats env overrides
# from cargo wrapper scripts), and run cargo from a neutral cwd outside $HOME —
# cargo discovers .cargo/config.toml in every ancestor of the cwd, so building
# under ~/.cache/paru would otherwise still read the user's ~/.cargo config.
_cargo_env() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTFLAGS="${RUSTFLAGS:-}"
    _manifest="$srcdir/$pkgname-$pkgver/Cargo.toml"
    _target="$srcdir/$pkgname-$pkgver/target"
    cd /
}

prepare() {
    _cargo_env
    cargo fetch --locked --manifest-path "$_manifest" --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    _cargo_env
    cargo build --frozen --release --manifest-path "$_manifest" --target-dir "$_target"
}

check() {
    _cargo_env
    cargo test --frozen --release --manifest-path "$_manifest" --target-dir "$_target"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"

    "./target/release/$pkgname" completions bash > "$srcdir/$pkgname.bash"
    "./target/release/$pkgname" completions zsh  > "$srcdir/_$pkgname"
    "./target/release/$pkgname" completions fish > "$srcdir/$pkgname.fish"
    install -Dm644 "$srcdir/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "$srcdir/_$pkgname"     "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 "$srcdir/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
