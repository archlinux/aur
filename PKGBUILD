# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=ghpending
pkgver=0.3.3
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
sha256sums=('31e6bcf20a24819a7040ad407ca31d10e05059d8a9a0a881910cc8d5151fa4d9')

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
