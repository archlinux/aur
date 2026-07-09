# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=rake-unstable
pkgver=0.6.0
pkgrel=1
pkgdesc="Configuration-driven build tool that runs Rakefile.toml targets (nightly unstable build)"
arch=('x86_64')
url="https://github.com/rustyhorde/cargo-rake"
license=('MIT' 'Apache-2.0')
provides=('rake')
conflicts=('rake')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rustyhorde/cargo-rake/archive/v$pkgver.tar.gz")
# Checksum is filled in by the release workflow before publishing to the AUR.
sha256sums=('a162f12c7243c3a524c630e2aca1e3280bdad41083f3637c694820e6fd51506e')

prepare() {
    cd "cargo-rake-$pkgver"
    # The `unstable` feature is a functional no-op (it only toggles nightly-only
    # lint gates), so the unstable variant builds on the stable toolchain just
    # like `rake`.
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "cargo-rake-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export VERGEN_IDEMPOTENT=1
    cargo build --release --locked --bin rake --features unstable
    cargo run --release --locked -p xtask -- dist rake
}

package() {
    cd "cargo-rake-$pkgver"

    install -Dm755 "target/release/rake" "$pkgdir/usr/bin/rake"

    # Man page
    install -Dm644 "dist/rake/rake.1" "$pkgdir/usr/share/man/man1/rake.1"

    # Shell completions
    install -Dm644 "dist/rake/rake.bash" \
        "$pkgdir/usr/share/bash-completion/completions/rake"
    install -Dm644 "dist/rake/_rake" \
        "$pkgdir/usr/share/zsh/site-functions/_rake"
    install -Dm644 "dist/rake/rake.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/rake.fish"

    # Example Rakefile and documentation
    install -Dm644 "dist/rake/Rakefile.toml.example" \
        "$pkgdir/usr/share/doc/$pkgname/examples/Rakefile.toml.example"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
