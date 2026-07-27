pkgname=test-yourself
pkgver=1.2.2
pkgrel=1
pkgdesc="A modern, highly-polished quiz and testing application"
arch=('x86_64')
url="https://github.com/albibenni/test-yourself"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'glib2' 'pango' 'gdk-pixbuf2' 'libayatana-appindicator')
makedepends=('cargo' 'nodejs' 'npm' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/albibenni/test-yourself/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"

    # Fix for Arch Linux LLVM 22 vs Rust LLVM 21 LTO linking panic in libsodium
    export CFLAGS="${CFLAGS/-flto/} -fno-lto"
    export CXXFLAGS="${CXXFLAGS/-flto/} -fno-lto"
    export LDFLAGS="${LDFLAGS/-flto/} -fno-lto"
    export RUSTUP_TOOLCHAIN=stable

    # Install frontend dependencies
    pnpm install

    # Build only the DEB bundle.
    # We do this because the Tauri DEB bundler automatically generates
    # the perfectly structured .desktop files and icon folders for us!
    pnpm tauri build -b deb
}

package() {
    cd "$pkgname-$pkgver"

    # The Tauri bundler outputs the compiled binary, icons, and .desktop file
    # inside this cleanly structured mock data directory.
    # We simply copy its contents directly into the Arch Linux package directory.
    cp -r src-tauri/target/release/bundle/deb/*/data/usr "$pkgdir/"
}
