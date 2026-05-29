pkgname=susshi
pkgver=0.18.1
pkgrel=1
pkgdesc='modern, terminal-based SSH connection manager'
url='https://github.com/yatoub/susshi'
license=('MIT')
makedepends=('cargo')
depends=('openssh')
arch=('i686' 'x86_64' 'aarch64' 'armv6h' 'armv7h')
source=("https://github.com/yatoub/susshi/archive/refs/tags/v$pkgver.tar.gz")
b2sums=(6efc4d3774bd69c10c0f9520948c967791c411386c18311e662d2b97afbac6c03ad7d584a8b051eb47675deaaa5b51a74d22b37c5a83df9bf7c863f9c557b89c)

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
