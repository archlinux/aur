pkgname=susshi
pkgver=0.20.1
pkgrel=1
pkgdesc='modern, terminal-based SSH connection manager'
url='https://github.com/yatoub/susshi'
license=('MIT')
makedepends=('cargo')
depends=('openssh')
arch=('i686' 'x86_64' 'aarch64' 'armv6h' 'armv7h')
source=("https://github.com/yatoub/susshi/archive/refs/tags/v$pkgver.tar.gz")
b2sums=(026e6d3c9b607247b9ab1105a2eeb6cb8431093b27c7053b226ed7dfb5cd45685d446706607cdf16038d64bad4cb625e4d0c4359a7f8d0ad4ef936bde6ab330f)

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed 's/host: //;t;d')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 target/man/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    find docs/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;
    find examples/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;
}
