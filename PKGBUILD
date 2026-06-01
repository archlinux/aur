# Maintainer: Bryson Kelly <https://github.com/brysonak>
pkgname=buf-cli
_binname=buf
pkgver=0.1.2
pkgrel=1
_srcdir="buf-$pkgver"
pkgdesc="A fast, safe bootable USB image flasher"
arch=('x86_64' 'aarch64')
url="https://github.com/brysonak/buf"
license=('GPL-3.0-or-later')
depends=()
makedepends=('rust' 'cargo')
source=("buf-$pkgver.tar.gz::https://github.com/brysonak/buf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --package buf
}

check() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --locked --package buf
}

package() {
    cd "$_srcdir"
    install -Dm755 "target/release/$_binname" "$pkgdir/usr/bin/$_binname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "docs/docs.md" "$pkgdir/usr/share/doc/$pkgname/docs.md"
}
