# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=ghpending
pkgver=0.3.2
pkgrel=1
pkgdesc="Watch GitHub repos for open issues and pull requests at a glance"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/ghpending"
license=('MIT')
depends=('gcc-libs' 'glibc' 'ca-certificates')
makedepends=('cargo')
# Cargo's release profile strips symbols, so the auto-generated -debug split
# would be empty and would collide with ghpending-bin-debug if both package
# variants were ever installed on the same machine.
options=('!debug')
conflicts=('ghpending-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25b4f2a9a424f8cce0b35ef9b69710006c2da97170ce4ee150f7b19af61dcfac')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/"                target/release/ghpending
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
