# Maintainer: Hao Long <imlonghao@archlinuxcn.org>

pkgname=vykar
pkgver=0.22.0
pkgrel=1
pkgdesc='Fast, encrypted, deduplicated backups in Rust'
url='https://github.com/borgbase/vykar'
license=('GPL-3.0-or-later')
makedepends=('cargo' 'cairo' 'pango' 'atk')
depends=('glibc' 'libgcc' 'libstdc++' 'freetype2' 'gtk3' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'xdotool')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('4b8dcef58b6cf3eb88930a309d5bd7ad4d695f1f7911d184b7bca1f618e23b224fe2c108206134f856543c79020424ab1bb73ea77b4c463b4b77f4eda3a45e14')

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
