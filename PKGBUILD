# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: ny-a <nyaarch64 at gmail dot com>
# Contributor: Jean Lucas <jean at 4ray dot co>

pkgname=tiny
pkgver=0.11.0
pkgrel=1
pkgdesc='A terminal IRC client written in Rust'
arch=(x86_64)
url=https://github.com/osa1/tiny
license=(MIT)

provides=($pkgname)
conflicts=($pkgname)
replaces=(tiny-irc-client)
depends=(dbus)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(4bd412760a35ff41220ab918702d003c710379537db9621477f63ee201a68440)

prepare() {
    cd "$srcdir"/$pkgname-$pkgver
    cargo update
    cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
    cd "$srcdir"/$pkgname-$pkgver
    cargo build --frozen --release --features desktop-notifications
}

# TODO: re-enable in the next tagged release
# refer: issue #407, commit aaac385
# check() {
#     cd "$srcdir"/$pkgname-$pkgver
#     cargo test --frozen --workspace --features desktop-notifications
# }

package() {
    cd "$srcdir"/$pkgname-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        ARCHITECTURE.md CHANGELOG.md README.md
    install -Dm644 -t "$pkgdir"/usr/share/$pkgname crates/$pkgname/config.yml
}
