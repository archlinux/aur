# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)
# Contributor: Jon Gjengset <jon@tsp.io>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
pkgname=rustup-git
pkgver=1.25.2.r221.gac7fb954
pkgrel=1
pkgdesc="The Rust toolchain installer"
arch=('x86_64')
url="https://github.com/rust-lang/rustup"
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
source=("${pkgname}::git+https://github.com/rust-lang/rustup.git" "list-proxy-names.rs")
sha512sums=('SKIP'
            '3b8cca51fdf62bbd379a5a530e00609fc3192aa1e88b3f392621f356d5e9c6d93cb8767dee2d679bed86baaa369dec77ceb2e3d4d281e4c7c2098b324125deb4')

pkgver() {
    cd "$srcdir/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
   cd "$srcdir"
   cp list-proxy-names.rs $pkgname/src/bin
}

build() {
    cd "$srcdir/$pkgname"
    env --unset=CARGO_TARGET_DIR cargo build --release --features no-self-update --bin rustup-init --bin list-proxy-names
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/rustup-init" "${pkgdir}/usr/bin/rustup"
    for proxy in $(target/release/list-proxy-names); do
        ln -s /usr/bin/rustup "${pkgdir}/usr/bin/${proxy}"
    done

    # Generate completion files.
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    "$pkgdir"/usr/bin/rustup completions bash > "$pkgdir/usr/share/bash-completion/completions/rustup"
    "$pkgdir"/usr/bin/rustup completions bash cargo > "$pkgdir/usr/share/bash-completion/completions/cargo"
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
    "$pkgdir"/usr/bin/rustup completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/rustup.fish"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir"/usr/bin/rustup completions zsh > "$pkgdir/usr/share/zsh/site-functions/_rustup"
    "$pkgdir"/usr/bin/rustup completions zsh cargo > "$pkgdir/usr/share/zsh/site-functions/_cargo"

    install -Dm644 LICENSE-MIT "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-MIT
    install -Dm644 LICENSE-APACHE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-APACHE
}

# vim:filetype=sh:
