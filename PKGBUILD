# Maintainer: Yanus Poluektovich <ypoluektovich at gmail dot com>
pkgname=estuary
pkgver=0.1.1
pkgrel=2
pkgdesc="A registry for Rust crates"
arch=('x86_64')
url="https://github.com/onelson/estuary"
license=('Apache' 'MIT') # as stated in Cargo.toml, though I don't see a license file in the repo
depends=('git' 'libgit2')
makedepends=('cargo')
backup=('etc/estuary/estuary.env')
install="estuary.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/onelson/estuary/archive/refs/tags/v${pkgver}.tar.gz"
        "$pkgname.service"
        "$pkgname.env")
md5sums=('02fe8ab490e26eef8044abdbc6defddb'
         'db4531b2a0bbcb1f6a8d916cf3e8d146'
         'e5180097147f4358a63475f86bb9d9a7')
sha1sums=('4b6c71736f8f046afeb5eea03b9876e43b179720'
          'c3f9d6492075db7fac29b4023911b8f98fdbacb5'
          'acc322fc11b7741878a90593674e3ca8c2e0d115')
sha256sums=('8a56ab0e3973292674a79e320d1f4b4e2692963f5ababbec213a2d6cb3511314'
            '7f1bed0d17c6318add8214f1ad51455c210dd2f92a85e24941647e633d5c8efd'
            'd79a3991e40a5f0ea9c332f562f32b6c5d1941964a7ce4a59282d20ac3e00d33')
sha512sums=('ba37bb4d08c98fbded597a9a7197fda735b73240afd387bc709739aebf9ff013b4243dc61bf2ce283b5159b26dda43ebd0f5a435a60bad67cabc4cde70369c33'
            '976e23cf275332eb16938631ca69426856edb2332527ac3825ed9006cd9eaf71e5732fcbb69c85a9962552aae22b85b0d33a80143b7cdea1dcce8580b07f4ca1'
            '91d2c2304a7459a25d36a82fc7bd0a0c95957d663d1bff926d4f3c25263672a7d73686f587072df08cd34e4366d8c654bcfa4c8d44da708b110de60318e71e1b')
b2sums=('2dbbfe69c3bba508a7b4d1f6b56d2ef224aa83ebce79a5f0a94287a9b3e5f9d6840f1255518531fdac8f04c97b7d6231d08f34de5967fcb8e8b1e16c4edf432d'
        'd51912fc3f35fcf597aeb229c94204f5a2be54bf6b2653f1bc40c554b96651c73c089d4d3d6214d7861ea4df0a2ccf211363f0fb40d6480e7d901034461807c1'
        '45ea9e78e924a067b58e8962bff77faa3d7f920b1bafb7d9450f90bea1c82745a5ffa83db02d479bf590a95b5dfc73865415cde448092c0d0cb385ed6412f0a6')

prepare() {
    cd "$pkgname-$pkgver"
    cargo update # otherwise old crate openssl-sys won't build with new openssl
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
    cargo test --frozen
}

package() {
    install -Dm0600 -t "$pkgdir/etc/$pkgname/" "$pkgname.env"
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "$pkgname.service"

    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
