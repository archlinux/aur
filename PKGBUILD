# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)
# Contributor: Jon Gjengset <jon@tsp.io>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
pkgname=rustup-git
pkgver=1.25.1.r39.gb3d53252
pkgrel=1
pkgdesc="The Rust toolchain installer"
arch=('x86_64')
url="https://github.com/rust-lang/rustup.rs"
license=('MIT' 'Apache')
depends=('curl')
makedepends=('git' 'cargo')
optdepends=('lldb: rust-lldb script'
            'gdb: rust-gdb script')
provides=('rust' 'cargo' 'rust-nightly' 'cargo-nightly' 'rustfmt' 'rust-src'
          'lib32-rust-libs' 'rust-musl' 'rust-wasm' 'rustup')
conflicts=('rust' 'cargo' 'rustfmt' 'rust-nightly' 'rust-nightly-bin' 'rustup')
replaces=('cargo-tree')
install='post.install'
source=("${pkgname}::git+https://github.com/rust-lang/rustup.git")
sha512sums=('SKIP')
_binlinks=('cargo' 'rustc' 'rustdoc' 'rust-gdb' 'rust-lldb' 'rls' 'rustfmt' 'cargo-fmt' 'cargo-clippy' 'clippy-driver' 'cargo-miri')

pkgver() {
    cd "$srcdir/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    env --unset=CARGO_TARGET_DIR cargo build --release --features no-self-update --bin rustup-init
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/rustup-init" "${pkgdir}/usr/bin/rustup"
    for link in "${_binlinks[@]}"; do
        ln -s /usr/bin/rustup "${pkgdir}/usr/bin/${link}"
    done

    # Generate completion files.
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    "$pkgdir"/usr/bin/rustup completions bash > "$pkgdir/usr/share/bash-completion/completions/rustup"
    "$pkgdir"/usr/bin/rustup completions bash cargo > "$pkgdir/usr/share/bash-completion/completions/cargo"
    mkdir -p "$pkgdir/usr/share/fish/completions"
    "$pkgdir"/usr/bin/rustup completions fish > "$pkgdir/usr/share/fish/completions/rustup.fish"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir"/usr/bin/rustup completions zsh > "$pkgdir/usr/share/zsh/site-functions/_rustup"
    "$pkgdir"/usr/bin/rustup completions zsh cargo > "$pkgdir/usr/share/zsh/site-functions/_cargo"

    install -Dm644 LICENSE-MIT "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-MIT
    install -Dm644 LICENSE-APACHE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-APACHE
}

# vim:filetype=sh:
