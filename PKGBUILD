# Maintainer: Jon Gjengset <jon@tsp.io>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
pkgname=rustup-git
pkgver=1.19.0.r70.gfbcc6720
pkgrel=2
pkgdesc="The Rust toolchain installer"
arch=('x86_64')
url="https://github.com/rust-lang/rustup.rs"
license=('MIT' 'Apache')
makedepends=('git' 'cargo')
optdepends=('lldb: rust-lldb script'
            'gdb: rust-gdb script')
provides=('rust' 'cargo' 'rust-nightly' 'cargo-nightly' 'rustfmt' 'rustup')
conflicts=('rust' 'cargo' 'rustfmt' 'rust-nightly' 'rust-nightly-bin' 'rustup')
install='post.install'
source=("${pkgname}::git+https://github.com/rust-lang-nursery/rustup.rs.git")
sha512sums=('SKIP')
_binlinks=('cargo' 'rustc' 'rustdoc' 'rust-gdb' 'rust-lldb' 'rls' 'rustfmt' 'cargo-fmt' 'cargo-clippy' 'clippy-driver')

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
    $pkgdir/usr/bin/rustup completions bash > "$pkgdir/usr/share/bash-completion/completions/rustup"
    mkdir -p "$pkgdir/usr/share/fish/completions"
    $pkgdir/usr/bin/rustup completions fish > "$pkgdir/usr/share/fish/completions/rustup.fish"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    $pkgdir/usr/bin/rustup completions zsh > "$pkgdir/usr/share/zsh/site-functions/_rustup"

    install -Dm644 LICENSE-MIT "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-MIT
    install -Dm644 LICENSE-APACHE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-APACHE
}

# vim:filetype=sh:
