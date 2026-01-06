# Maintainer: jopdorp <jegor@jopdorp.nl>
pkgname=bigedit
pkgver=0.1.16
pkgrel=1
pkgdesc="A fast text editor for very large files using journaling and FUSE"
arch=('x86_64')
url="https://github.com/jopdorp/bigedit"
license=('MIT')
depends=('fuse3' 'inotify-tools')
makedepends=('cargo' 'git')
install=bigedit.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/jopdorp/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4631cd56b9e23b41c17f77b477afa2cf948c855c722b62188eb493225ef189d3')
backup=()

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

# Skip check() - some integration tests require python3 and interactive terminal
# check() {
#     cd "$pkgname-$pkgver"
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --release
# }

package() {
    cd "$pkgname-$pkgver"
    
    # Install binaries
    install -Dm755 "target/release/bigedit" "$pkgdir/usr/bin/bigedit"
    install -Dm755 "target/release/bigedit-fuse" "$pkgdir/usr/bin/bigedit-fuse"
    install -Dm755 "systemd/bigedit-watcher" "$pkgdir/usr/bin/bigedit-watcher"
    
    # Install systemd user services
    install -Dm644 "systemd/bigedit-watcher.service" "$pkgdir/usr/lib/systemd/user/bigedit-watcher.service"
    install -Dm644 "systemd/bigedit-fuse@.service" "$pkgdir/usr/lib/systemd/user/bigedit-fuse@.service"
    
    # Install preset to enable service by default
    install -Dm644 "systemd/90-bigedit.preset" "$pkgdir/usr/lib/systemd/user-preset/90-bigedit.preset"
    
    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
