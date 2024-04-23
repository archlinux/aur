# Maintainer: sommerfeld <sommerfeld@sommerfeld.dev>

pkgname=sentrum
pkgver=0.1.4
pkgrel=1
pkgdesc="Daemon that monitors watch-only bitcoin wallets"
arch=('any')
url="https://github.com/sommerfelddev/$pkgname"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.sysusers"
    "$pkgname.tmpfiles")
sha256sums=('e68d2174879689d03c1546f1144f8955b76917b57da2192c690b3294b26940c6'
            'a4037f74fac93f099f7b11dff3399d74cc933b38748369b263f6f2e03e3024e1'
            'a1a6fc23534730cd9fa016a7beca37d88bd6a04d38d10f02e6c213212f4630d6')
backup=("etc/$pkgname/$pkgname.toml")
options=('!lto')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    install -Dm644 contrib/$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -Dm644 $pkgname.sample.toml "$pkgdir/etc/$pkgname/$pkgname.toml"


    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
