# Maintainer: Biggs <biggs at sergeantbiggs dot net>
pkgname=valheim-mod-manager
pkgver=0.4.1
pkgrel=1
pkgdesc='A command-line tool for managing and automatically downloading Valheim mods and their dependencies'
url='https://github.com/Endoze/valheim-mod-manager'
license=("MIT")
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://github.com/endoze/valheim-mod-manager/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ab4ec99bd10c783aa4ce21722e6aeefebd3bc8d70056b8c843523ff09eb86b4e7fff683a85d5efbcbb047387c6805b56a784e970ef9902ce267655e030762c2c')
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
