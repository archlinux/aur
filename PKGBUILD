# Maintainer: metaneutrons <https://github.com/metaneutrons>
pkgname=bups
pkgver=0.3.3
pkgrel=1
pkgdesc="USB print server for Brother PT and QL label printers"
arch=('x86_64' 'aarch64')
url="https://github.com/metaneutrons/bups"
license=('GPL-3.0-or-later')
depends=('systemd-libs')
makedepends=('cargo' 'systemd')
# Measured from the tar listing of v0.3.3, not derived from pkgver.
_srcdir='bups-0.3.3'
source=("$pkgname-$pkgver.tar.gz::https://github.com/metaneutrons/bups/archive/refs/tags/v0.3.3.tar.gz")
sha256sums=('ddb622e671e5cb11f25a4e55ee326e84e7f354e806efa83a32aead50bdc586ed')

prepare() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$_srcdir"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 debian/bups.udev "$pkgdir/usr/lib/udev/rules.d/60-bups.rules"
}
