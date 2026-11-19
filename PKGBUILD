# Maintainer: Biggs <biggs at sergeantbiggs dot net>
pkgname=valheim-mod-manager
pkgver=0.4.3
pkgrel=1
pkgdesc='A command-line tool for managing and automatically downloading Valheim mods and their dependencies'
url='https://github.com/Endoze/valheim-mod-manager'
license=("MIT")
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://github.com/endoze/valheim-mod-manager/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('9c2726e6fb2f0314ddb31e7470b78599dbffed5376d6f18805de90bb9ad4e551002d1ea95e62c6803c2370382fc9c6cb353201721888862ab2343b47ac6805ce')
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
