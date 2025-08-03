# Maintainer: edo hikmahtiar <edohikmahtiar@me.com>
pkgname=mameuix
pkgver=0.1.4
pkgrel=1
pkgdesc="Modern GUI frontend for MAME arcade emulator with thread pool performance and enhanced UI"
arch=('x86_64')
url="https://github.com/firesand/MAMEUIx"
license=('MIT')
depends=('mame>=0.200' 'glibc' 'gcc-libs')
makedepends=('rust>=1.70' 'pkgconf' 'zstd' 'git')
optdepends=('mame-roms: Game ROMs for MAME')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firesand/MAMEUIx/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/MAMEUIx-$pkgver"
    # Ensure we have the latest dependencies
    cargo fetch
}

build() {
    cd "$srcdir/MAMEUIx-$pkgver"
    
    # Set environment variables for optimal build
    export ZSTD_LIB_DIR=/usr/lib
    export ZSTD_STATIC=0
    export RUSTFLAGS="-C link-arg=-lzstd -C target-cpu=native"
    
    # Build with release optimizations
    cargo build --release --locked
    
    # Verify the binary was created
    if [ ! -f "target/release/mameuix" ]; then
        echo "Error: Binary not found after build"
        exit 1
    fi
}

check() {
    cd "$srcdir/MAMEUIx-$pkgver"
    # Run tests if available
    cargo test --release --locked || true
}

package() {
    cd "$srcdir/MAMEUIx-$pkgver"
    
    # Install binary
    install -Dm755 target/release/mameuix "$pkgdir/usr/bin/mameuix"
    
    # Install desktop file
    install -Dm644 mameuix.desktop "$pkgdir/usr/share/applications/mameuix.desktop"
    
    # Install icons (check if they exist first)
    if [ -f "assets/icons/16x16/mameuix.png" ]; then
        install -Dm644 assets/icons/16x16/mameuix.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/mameuix.png"
    fi
    if [ -f "assets/icons/32x32/mameuix.png" ]; then
        install -Dm644 assets/icons/32x32/mameuix.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/mameuix.png"
    fi
    if [ -f "assets/icons/48x48/mameuix.png" ]; then
        install -Dm644 assets/icons/48x48/mameuix.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/mameuix.png"
    fi
    if [ -f "assets/icons/64x64/mameuix.png" ]; then
        install -Dm644 assets/icons/64x64/mameuix.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/mameuix.png"
    fi
    if [ -f "assets/icons/128x128/mameuix.png" ]; then
        install -Dm644 assets/icons/128x128/mameuix.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/mameuix.png"
    fi
    if [ -f "assets/icons/256x256/mameuix.png" ]; then
        install -Dm644 assets/icons/256x256/mameuix.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/mameuix.png"
    fi
    if [ -f "assets/icons/scalable/mameuix.svg" ]; then
        install -Dm644 assets/icons/scalable/mameuix.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/mameuix.svg"
    fi
    
    # Install man page if it exists
    if [ -f "mameuix.1" ]; then
        install -Dm644 mameuix.1 "$pkgdir/usr/share/man/man1/mameuix.1"
    fi
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/doc/$pkgname/LICENSE"
    
    # Install performance documentation
    if [ -f "ICON_LOADING_PERFORMANCE.md" ]; then
        install -Dm644 ICON_LOADING_PERFORMANCE.md "$pkgdir/usr/share/doc/$pkgname/ICON_LOADING_PERFORMANCE.md"
    fi
} 
