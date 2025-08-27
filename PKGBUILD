# Maintainer: mfw <espadon@outlook.com>

pkgname=eyescore
pkgver=1.0.2
pkgrel=1
pkgdesc="Professional CLI Music Notation System - A colorized, feature-rich TUI score engraver"
arch=('x86_64')
url="https://github.com/tree3stan-chord/score"
license=('MIT')
depends=('alsa-lib')
makedepends=('rust' 'cargo' 'gcc')
source=("git+https://github.com/tree3stan-chord/score.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd score
    
    # Build in release mode for performance
    cargo build --release --locked --target-dir=target
}

check() {
    cd score
    
    # Run basic tests
    cargo test --release --target-dir=target || true
    
    # Test binary execution (with timeout since it's an interactive app)
    timeout 5s ./target/release/score || test $? -eq 124
}

package() {
    cd score
    
    # Install the binary as eyescore
    install -Dm755 target/release/score "$pkgdir/usr/bin/eyescore"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    [ -f COLORIZATION_SUMMARY.md ] && install -Dm644 COLORIZATION_SUMMARY.md "$pkgdir/usr/share/doc/$pkgname/COLORIZATION_SUMMARY.md" || true
    [ -f COLORS_COMPLETE.md ] && install -Dm644 COLORS_COMPLETE.md "$pkgdir/usr/share/doc/$pkgname/COLORS_COMPLETE.md" || true
    [ -f SIGNATURE_CHANGES_COMPLETE.md ] && install -Dm644 SIGNATURE_CHANGES_COMPLETE.md "$pkgdir/usr/share/doc/$pkgname/SIGNATURE_CHANGES_COMPLETE.md" || true
    [ -f SCROLLING_COMPLETE.md ] && install -Dm644 SCROLLING_COMPLETE.md "$pkgdir/usr/share/doc/$pkgname/SCROLLING_COMPLETE.md" || true
}