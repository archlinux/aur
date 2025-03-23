# Maintainer: Alex Kolarski <alex@kolarski.com>
pkgname=s-screen
pkgver=0.1.2
pkgrel=1
pkgdesc="A minimalist wrapper around screen that makes terminal session management dead simple. Documentation: https://kolarski.github.io/s/"
arch=('x86_64')
url="https://github.com/kolarski/s"
license=('GPL-3.0')
depends=('screen')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kolarski/s/archive/v$pkgver.tar.gz")
sha256sums=('c5a529d6b46b85552cee28c1a80cb1f7ca03c11df76c12bad493bf6beb77d4c3')

prepare() {
    cd "s-$pkgver"
    cargo fetch
}

build() {
    cd "s-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release
}

check() {
    cd "s-$pkgver"
    cargo test
}

package() {
    cd "s-$pkgver"
    install -Dm755 "target/release/s" "$pkgdir/usr/bin/s"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Only install CHANGELOG.md if it exists
    if [ -f "CHANGELOG.md" ]; then
        install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    fi
    
    # Create a documentation directory and add a link to the website
    install -d "$pkgdir/usr/share/doc/$pkgname"
    echo "Documentation: https://kolarski.github.io/s/" > "$pkgdir/usr/share/doc/$pkgname/WEBSITE"
} 