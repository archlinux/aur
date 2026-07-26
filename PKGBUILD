# Maintainer: Berke Oruc <berke@monamc.dev>
# Contributor: Berke Oruc

pkgname=monamc
pkgver=0.1.0
pkgrel=1
pkgdesc="MonaMC - A TUI Minecraft Launcher for Arch Linux. Freedom launcher, no account required."
arch=('x86_64' 'aarch64')
url="https://github.com/BerkeOruc/monamc"
license=('MIT')
depends=(
    'java-runtime>=17'
    'glibc'
    'gcc-libs'
)
makedepends=('cargo' 'rust' 'pkg-config')
install=monamc.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1208f82dcb15569acb8c46a0517c4651ea7968cd686894ad296bb452b0ac37d0')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTFLAGS="-C target-cpu=native"
    cargo build --release --locked
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "dist/aur/$pkgname.install" "$pkgdir/usr/share/$pkgname/$pkgname.install"

    # Install desktop file and icon
    install -Dm644 "dist/monamc.desktop" "$pkgdir/usr/share/applications/monamc.desktop"
    echo "MonaMC installed successfully!"
    echo "Run 'monamc' from your terminal to start the launcher."
}
