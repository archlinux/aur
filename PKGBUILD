# Maintainer: Andy Kelk <andy@mopoke.co.uk>
pkgname=vm-curator
pkgver=0.1.1
pkgrel=1
pkgdesc="A terminal user interface for QEMU/KVM virtual machine management"
arch=('x86_64')
url="https://github.com/mroboff/vm-curator"
license=('MIT')
depends=('qemu-base' 'systemd-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mroboff/vm-curator/archive/refs/tags/initial-release.tar.gz")
sha256sums=('6fff1469d04636fc13d9e9b494c2b07ba267f7746a52e6c514ac3891c9bb1436')

prepare() {
    cd "$srcdir/$pkgname-initial-release"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-initial-release"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-initial-release"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-initial-release"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
