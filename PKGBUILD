# Maintainer: Hao Long <imlonghao@archlinuxcn.org>

pkgname=vykar
pkgver=0.16.0
pkgrel=1
pkgdesc='Fast, encrypted, deduplicated backups in Rust'
url='https://github.com/borgbase/vykar'
license=('GPL-3.0-or-later')
makedepends=('cargo' 'cairo' 'pango' 'atk')
depends=('glibc' 'libgcc' 'libstdc++' 'freetype2' 'gtk3' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'xdotool')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('1fe3a14f4d761323b9ebb046bbcefd3553e6c214433eb3bea4bc3c9ebfc8ff5f4dcec465dfabfae5c7de527b25b0cf3d3ac4867a31e612ec11f97b527d50caf9')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    CFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    ls -al "target/release/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/vykar target/release/vykar-server target/release/vykar-gui
    install -Dm0644 -t "$pkgdir/etc/vykar/" vykar.example.yaml
}
