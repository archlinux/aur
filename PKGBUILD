# Maintainer: m5rcode contributors
pkgname=m5rcode
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern programming language combining Python, C, Java, HolyC, Rust, and Ruby"
arch=('x86_64')
url="https://github.com/m5rcode/m5rcode"
license=('MIT' 'Apache')
depends=('gcc-libs' 'glibc')
makedepends=('rust' 'cargo' 'pkg-config')
optdepends=(
    'gtk3: for m5idle GUI'
    'llvm: for LLVM backend'
)
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Build compiler
    cd compiler
    cargo build --release
    cd ..
    
    # Build tools
    cd tools/m5repl
    cargo build --release
    cd ../..
    
    cd tools/m5idle
    cargo build --release
    cd ../..
    
    # Build formatter
    rustc --edition 2021 -O tools/m5fmt.rs -o target/release/m5fmt
    
    # Build linter
    rustc --edition 2021 -O tools/m5lint.rs -o target/release/m5lint
    
    # Build LSP
    cd tools/lsp
    cargo build --release
    cd ../..
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Run compiler tests
    cd compiler
    cargo test --release
    cd ..
    
    # Run integration tests
    ./target/release/m5repl packages/hello_world.m5 || exit 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install main command
    install -Dm755 m5rcode "$pkgdir/usr/bin/m5rcode"
    
    # Install binaries
    install -Dm755 compiler/target/release/m5r "$pkgdir/usr/bin/m5r"
    install -Dm755 tools/m5repl/target/release/m5repl "$pkgdir/usr/bin/m5repl"
    install -Dm755 tools/m5idle/target/release/m5idle "$pkgdir/usr/bin/m5idle"
    install -Dm755 target/release/m5fmt "$pkgdir/usr/bin/m5fmt"
    install -Dm755 target/release/m5lint "$pkgdir/usr/bin/m5lint"
    install -Dm755 tools/lsp/target/release/m5lsp "$pkgdir/usr/bin/m5lsp"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install spec files
    install -dm755 "$pkgdir/usr/share/doc/$pkgname/spec"
    install -Dm644 SPEC/*.md "$pkgdir/usr/share/doc/$pkgname/spec/"
    install -Dm644 SPEC/*.ebnf "$pkgdir/usr/share/doc/$pkgname/spec/"
    
    # Install examples
    install -dm755 "$pkgdir/usr/share/doc/$pkgname/examples"
    cp -r packages/* "$pkgdir/usr/share/doc/$pkgname/examples/"
}
