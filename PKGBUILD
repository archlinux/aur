# Maintainer: Biggs <biggs at sergeantbiggs dot net>
pkgname=valheim-mod-manager
pkgver=0.4.2
pkgrel=1
pkgdesc='A command-line tool for managing and automatically downloading Valheim mods and their dependencies'
url='https://github.com/Endoze/valheim-mod-manager'
license=("MIT")
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://github.com/endoze/valheim-mod-manager/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6b4afb4e67e8989d58cc8eea178f4caf1796db094cc1c3723e433de6ba25085bf093db5ccb7f91b408b775ed8b6a39f871a2ca492c16d706a7c3746020cc157c')
options=(!lto)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/vmm"
}
